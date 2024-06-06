<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| aws | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| aws | 5.52.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_s3_bucket.s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_cors_configuration.s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_cors_configuration) | resource |
| [aws_s3_bucket_lifecycle_configuration.s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_notification.sqs_bucket_notification](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_notification) | resource |
| [aws_s3_bucket_ownership_controls.lambda_codebase_ownership_control](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_policy.s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.public_access_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_versioning.s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_s3_bucket_website_configuration.s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_region | The AWS region to create the infrastructure in | `string` | `"eu-west-3"` | no |
| bucket\_acl | The bucket ACL | `string` | `"private"` | no |
| bucket\_cors\_rules | The bucket cors rules | `map` | `{}` | no |
| bucket\_lifecycle\_configuration\_rules | The bucket lifecycle configuration rules | `list` | `[]` | no |
| bucket\_name | The name of the bucket | `string` | `"hello"` | no |
| bucket\_ownership\_owner\_prefered | BucketOwnerPreferred value | `bool` | `true` | no |
| bucket\_policy | The bucket policy | `map` | `{}` | no |
| bucket\_role | Do you want to attach a role to your bucket? | `map(any)` | `{}` | no |
| bucket\_versioning | The bucket versioning | `bool` | `false` | no |
| bucket\_website | The bucket website | `bool` | `false` | no |
| bucket\_website\_cors\_rules | default website cors rules | `map(any)` | `{}` | no |
| bucket\_website\_error\_document | default website error document | `string` | `"error.html"` | no |
| bucket\_website\_index\_document | default website index document | `string` | `"index.html"` | no |
| bucket\_website\_routing\_rules | default website routing rules | `any` | `{}` | no |
| create\_public\_access\_block | Do you want to create public\_access\_block object. Avoid bc break for existing buckets (set it to false for buckets under or equals to 0.9.16) | `bool` | `true` | no |
| default\_tags | n/a | `map(string)` | <pre>{<br>  "deployed_by": "terraform",<br>  "module_github_repo": "https://github.com/OpenClassrooms/terraform-aws-s3-bucket-module",<br>  "stack": "infra"<br>}</pre> | no |
| environment\_variables | Environment variables for lambda function | `map(any)` | `{}` | no |
| sqs\_enabled | Do you want your s3 send event in a SQS message | `bool` | `false` | no |
| sqs\_queues\_config | The SQS queues configs | `map` | `{}` | no |
| tags | The tags to apply | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The bucket ARN |
| bucket\_regional\_domain\_name | The bucket\_regional\_domain\_name |
| name | The bucket name |
| website\_endpoint | The bucket website\_endpoint |

# AWS S3 bucket Terraform module

Terraform module which provision AWS S3 bucket.

## Usage

### AWS S3 bucket

```hcl

module "my_example_module" {
  source            = "../" # in this example, this is a local module. For real use, source will be "OpenClassrooms/lambda-apigw-module/aws"
  bucket_name       = "test_bucket"
  bucket_acl        = "private"
  bucket_versioning = true

  bucket_lifecycle_configuration = [{
    id = "test_bucket"

    status = "Enabled"

    transition = [{
      days          = 60
      storage_class = "GLACIER"
    }]

    expiration = [{
      days = 300
    }]
  }]

  bucket_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "S3FullAccess",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::123456789:root"
      },
      "Action": "s3:*",
      "Resource": ["arn:aws:s3:::test_bucket", "arn:aws:s3:::test_bucket/*"]
    }
  ]
}
POLICY
  sqs_enabled       = true
  sqs_queues_config = [
    {
      arn    = "arn:aws:sqs:*:*:s3-event-notification-queue"
      events = ["s3:ObjectCreated:*"]
    }
  ]
  tags = var.tags
}

```

## Example

[Complete example](https://github.com/OpenClassrooms/terraform-aws-s3-bucket-module/blob/master/example/main.tf) - Create AWS S3 bucket and all sub resources

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| [terraform](#requirement\_terraform)                                     | >= 1.1.2 |
| [aws](#requirement\_aws)                                                 | >= 4.2   |
<!-- END_TF_DOCS -->