resource "aws_s3_bucket_website_configuration" "s3_bucket" {
  count = var.bucket_website == true ? 1 : 0

  bucket = aws_s3_bucket.s3_bucket.bucket

  index_document {
    suffix = var.bucket_website_index_document
  }

  error_document {
    key = var.bucket_website_error_document
  }

  dynamic "routing_rule" {
    for_each = try(var.bucket_website_routing_rules, [])

    content {
      dynamic "condition" {
        for_each = [try([routing_rule.value.condition], [])]

        content {
          http_error_code_returned_equals = try(routing_rule.value.condition["http_error_code_returned_equals"], null)
          key_prefix_equals               = try(routing_rule.value.condition["key_prefix_equals"], null)
        }
      }

      redirect {
        host_name               = try(routing_rule.value.redirect["host_name"], null)
        http_redirect_code      = try(routing_rule.value.redirect["http_redirect_code"], null)
        protocol                = try(routing_rule.value.redirect["protocol"], null)
        replace_key_prefix_with = try(routing_rule.value.redirect["replace_key_prefix_with"], null)
        replace_key_with        = try(routing_rule.value.redirect["replace_key_with"], null)
      }
    }
  }
}
