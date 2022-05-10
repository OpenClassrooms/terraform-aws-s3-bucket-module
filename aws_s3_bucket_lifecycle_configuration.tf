resource "aws_s3_bucket_lifecycle_configuration" "s3_bucket" {
  count  = length(var.bucket_lifecycle_configuration_rules) > 0 ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket.bucket

  dynamic "rule" {
    for_each = var.bucket_lifecycle_configuration_rules
    content {
      id     = rule.value["id"]
      status = rule.value["status"]


      dynamic "transition" {
        for_each = try(rule.value["transition"], [])
        content {
          date          = try(transition.value["date"], null)
          days          = try(transition.value["days"], null)
          storage_class = try(transition.value["storage_class"], null)
        }
      }

      dynamic "expiration" {
        for_each = try(rule.value["expiration"], [])
        content {
          date                         = try(expiration.value["date"], null)
          days                         = try(expiration.value["days"], null)
          expired_object_delete_marker = try(expiration.value["expired_object_delete_marker"], null)
        }
      }
      #transition     = rule.value["transition"]
      #expiration = rule.value["expiration"]
    }
  }
}
