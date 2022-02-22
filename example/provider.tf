terraform {
  required_version = ">=v1.1.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.2"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "aws" {
  alias  = "north-virginia"
  region = "us-east-1"
}
