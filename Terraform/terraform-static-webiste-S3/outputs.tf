output "cloudfront_url" {
  value = aws_cloudfront_distribution.static_site.domain_name
}
output "s3_bucket_name" {
  value = aws_s3_bucket.static_website_bucket.bucket
}