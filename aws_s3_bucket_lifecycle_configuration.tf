resource "aws_s3_bucket_lifecycle_configuration" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.bucket

  rule = var.bucket_lifecycle_configuration
}
