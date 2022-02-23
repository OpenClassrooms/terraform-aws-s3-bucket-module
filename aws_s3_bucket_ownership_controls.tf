resource "aws_s3_bucket_ownership_controls" "lambda_codebase_ownership_control" {
  count  = var.bucket_ownership_owner_prefered ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
