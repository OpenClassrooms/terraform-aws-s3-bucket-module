resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.s3_bucket.id
}
