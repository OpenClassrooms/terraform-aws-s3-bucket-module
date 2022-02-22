variable "default_tags" {
  type = map(string)
  default = {
    deployed_by        = "terraform"
    stack              = "infra"
    module_github_repo = "https://github.com/OpenClassrooms/terraform-aws-s3-bucket-module"
    name               = var.bucket_name
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

variable "bucket_lifecycle_configuration" {
  description = "The bucket lifecycle configuration"
  type        = map(string)
  default     = {}
}

variable "bucket_policy" {
  description = "The bucket policy"
  type        = map(string)
  default     = {}
}
variable "bucket_cors" {
  description = "The bucket cors"
  type        = bool
  default     = false
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

variable "bucket_website_routing_rule" {
  description = "default website routing rules"
  type        = map(any)
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