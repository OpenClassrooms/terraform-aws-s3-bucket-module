resource "aws_iam_role" "s3_bucket" {
  count              = var.bucket_role ? 1 : 0
  name               = var.bucket_role.name
  assume_role_policy = var.bucket_role.assume_role_policy
}
