resource "aws_s3_bucket_cors_configuration" "s3_bucket" {
  count  = length(var.bucket_cors_rules) > 0 ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket.bucket

  #cors_rule = var.bucket_website_cors_rule
  dynamic "cors_rule" {
        for_each = var.bucket_cors_rules
        content {
          id              = cors_rule.value["id"]
          allowed_headers = cors_rule.value["allowed_headers"]
          allowed_methods = cors_rule.value["allowed_methods"]
          allowed_origins = cors_rule.value["allowed_origins"]
          expose_headers  = cors_rule.value["expose_headers"]
          max_age_seconds = cors_rule.value["max_age_seconds"]
        }
      }
}
