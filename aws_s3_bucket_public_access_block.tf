resource "aws_s3_bucket_public_access_block" "public_access_block" {
  count  = var.create_public_access_block ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket.id
}
