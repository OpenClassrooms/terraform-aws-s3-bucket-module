output "name" {
  description = "The bucket name"
  value       = aws_s3_bucket.s3_bucket.id
}
output "arn" {
  description = "The bucket ARN"
  value       = aws_s3_bucket.s3_bucket.arn
}
output "bucket_regional_domain_name" {
  description = "The bucket_regional_domain_name"
  value       = aws_s3_bucket.s3_bucket.bucket_regional_domain_name
}

output "website_endpoint" {
  description = "The bucket website_endpoint"
  value       = var.bucket_website ? aws_s3_bucket_website_configuration.s3_bucket[0].website_endpoint : null
}
