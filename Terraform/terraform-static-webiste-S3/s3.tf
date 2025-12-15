
# Create an S3 bucket
resource "aws_s3_bucket" "static_website_bucket" {
  bucket = var.s3-bucket-name

  tags = {
    Name        = var.s3-bucket-name
    Environment = "Dev"
  }
  
}

# Configure the bucket for static website hosting, block public access
resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.static_website_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#Upload website files
resource "aws_s3_object" "website" {
  for_each = fileset("${path.module}/website", "**")

  bucket = aws_s3_bucket.static_website_bucket.id
  key    = each.value
  source = "${path.module}/website/${each.value}"

  etag = filemd5("${path.module}/website/${each.value}")

  content_type = lookup(
    {
      ".html" = "text/html"
      ".css"  = "text/css"
      ".js"   = "application/javascript"
      ".png"  = "image/png"
      ".jpg"  = "image/jpeg"
      ".svg"  = "image/svg+xml"
      ".json" = "application/json"
    },
    regex("\\.[^.]+$", each.value),
    "binary/octet-stream"  # fallback for unknown files
  )
}


