resource "aws_iam_role" "s3_bucket" {
  for_each           = var.bucket_role
  name               = each.value.name
  assume_role_policy = each.value.assume_role_policy
}
