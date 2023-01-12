resource "aws_s3_bucket_notification" "sqs_bucket_notification" {
  count  = var.sqs_enabled ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket.id

  dynamic "queue" {
    for_each = var.sqs_queues_config
    content {
      queue_arn = queue.value["arn"]
      events    = queue.value["events"]
    }
  }
}
