resource "aws_s3_bucket_cors_configuration" "s3_bucket" {
  count  = var.bucket_cors ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket.bucket

  cors_rule = var.bucket_website_cors_rule
}
