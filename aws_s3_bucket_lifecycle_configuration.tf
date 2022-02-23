resource "aws_s3_bucket_lifecycle_configuration" "s3_bucket" {
  count  = len(var.bucket_lifecycle_configuration_rules) > 0 ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket.bucket

dynamic "rule" {
    for_each = var.bucket_lifecycle_configuration_rules
    content {
      namespace = setting.value["namespace"]
      name = setting.value["name"]
      value = setting.value["value"]
    }
  } 
}
