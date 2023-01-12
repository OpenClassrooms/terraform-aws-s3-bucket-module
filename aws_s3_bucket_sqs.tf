# The sqs part
locals {
  sqs_queues = var.sqs_enabled == true ? toset(var.sqs_queues_config) : []
}

resource "aws_s3_bucket_notification" "sqs_bucket_notification" {
  for_each         = local.sqs_queues
  bucket = aws_s3_bucket.s3_bucket.id

  queue {
    queue_arn     = each.value.arn
    events        = each.value.events
  }
}
