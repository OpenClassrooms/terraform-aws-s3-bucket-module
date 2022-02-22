variable "aws_region" {
  description = "The AWS region to create the infrastructure in"
  default     = "eu-west-3"
}

variable "tags" {
  type = map(string)
  default = {
    my_tag       = "test"
    a_second_tag = "test"
  }
}
