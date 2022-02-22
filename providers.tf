provider "aws" {
  default_tags {
    tags = merge(var.default_tags, var.tags)
  }
}
