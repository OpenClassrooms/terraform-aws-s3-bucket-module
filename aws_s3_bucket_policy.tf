resource "aws_s3_bucket_policy" "s3_bucket" {
  count  = length(var.bucket_policy) > 0 ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket.id
  policy = var.bucket_policy
}
