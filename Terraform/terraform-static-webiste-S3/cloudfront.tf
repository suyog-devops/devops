# Create CloudFront Origin Access Control
resource "aws_cloudfront_origin_access_control" "oac" {
  name                              = "s3-static-site-oac"
  description                       = "OAC for CloudFront to access private S3 bucket"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}



#   cloudfront.tf   
resource "aws_cloudfront_distribution" "static_site" {
  enabled             = true
  default_root_object = "index.html"

  origin {
    domain_name              = aws_s3_bucket.static_website_bucket.bucket_regional_domain_name
    origin_id                = "s3-static-site-origin"
    origin_access_control_id = aws_cloudfront_origin_access_control.oac.id
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "s3-static-site-origin"

    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  price_class = "PriceClass_100"

  tags = {
    Environment = "Dev"
  }
}


# S3 Bucket Policy to allow CloudFront access
data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.static_website_bucket.arn}/*"]

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [aws_cloudfront_distribution.static_site.arn]
    }
  }
}

# Apply the bucket policy
resource "aws_s3_bucket_policy" "allow_cloudfront" {
  bucket = aws_s3_bucket.static_website_bucket.id
  policy = data.aws_iam_policy_document.s3_policy.json
}

# #Ensures updated files show immediately
# resource "aws_cloudfront_distribution_invalidation" "invalidate" {
#   distribution_id = aws_cloudfront_distribution.static_site.id
#   paths           = ["/*"]
# }
