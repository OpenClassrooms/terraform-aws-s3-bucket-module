variable "default_tags" {
  type = map(string)
  default = {
    deployed_by        = "terraform"
    stack              = "infra"
    module_github_repo = "https://github.com/OpenClassrooms/terraform-aws-s3-bucket-module"
  }
}

variable "bucket_name" {
  description = "The name of the bucket"
  default     = "hello"
}

variable "bucket_acl" {
  description = "The bucket ACL"
  default     = "private"
}

variable "bucket_versioning" {
  description = "The bucket versioning"
  type        = bool
  default     = false
}

variable "bucket_lifecycle_configuration_rules" {
  description = "The bucket lifecycle configuration rules"
  #type        = map(map(any))
  default = []
}

variable "bucket_policy" {
  description = "The bucket policy"
  #type        = map(string)
  default = {}
}

variable "bucket_cors_rules" {
  description = "The bucket cors rules"
  #type        = bool
  default = {}
}

variable "bucket_website_cors_rules" {
  description = "default website cors rules"
  type        = map(any)
  default     = {}
}

variable "bucket_website" {
  description = "The bucket website"
  type        = bool
  default     = false
}

variable "bucket_website_index_document" {
  description = "default website index document"
  default     = "index.html"
}

variable "bucket_website_error_document" {
  description = "default website error document"
  default     = "error.html"
}

variable "bucket_website_routing_rules" {
  description = "default website routing rules"
  type        = any
  default     = {}
}

variable "tags" {
  description = "The tags to apply"
  type        = map(string)
  default     = {}
}

variable "environment_variables" {
  description = "Environment variables for lambda function"
  default     = {}
  type        = map(any)
}

variable "bucket_ownership_owner_prefered" {
  description = "BucketOwnerPreferred value"
  type        = bool
  default     = true
}

variable "aws_region" {
  description = "The AWS region to create the infrastructure in"
  default     = "eu-west-3"
}

variable "bucket_role" {
  description = "Do you want to attach a role to your bucket?"
  type        = map(any)
  default     = {}
}

variable "sqs_enabled" {
  description = "Do you want your s3 send event in a SQS message"
  type        = bool
  default     = false
}

variable "sqs_queues_config" {
  description = "The SQS queues configs"
  default     = {}
}
