<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.52.0 |

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
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to create the infrastructure in | `string` | `"eu-west-3"` | no |
| <a name="input_bucket_acl"></a> [bucket\_acl](#input\_bucket\_acl) | The bucket ACL | `string` | `"private"` | no |
| <a name="input_bucket_cors_rules"></a> [bucket\_cors\_rules](#input\_bucket\_cors\_rules) | The bucket cors rules | `map` | `{}` | no |
| <a name="input_bucket_lifecycle_configuration_rules"></a> [bucket\_lifecycle\_configuration\_rules](#input\_bucket\_lifecycle\_configuration\_rules) | The bucket lifecycle configuration rules | `list` | `[]` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the bucket | `string` | `"hello"` | no |
| <a name="input_bucket_ownership_owner_prefered"></a> [bucket\_ownership\_owner\_prefered](#input\_bucket\_ownership\_owner\_prefered) | BucketOwnerPreferred value | `bool` | `true` | no |
| <a name="input_bucket_policy"></a> [bucket\_policy](#input\_bucket\_policy) | The bucket policy | `map` | `{}` | no |
| <a name="input_bucket_role"></a> [bucket\_role](#input\_bucket\_role) | Do you want to attach a role to your bucket? | `map(any)` | `{}` | no |
| <a name="input_bucket_versioning"></a> [bucket\_versioning](#input\_bucket\_versioning) | The bucket versioning | `bool` | `false` | no |
| <a name="input_bucket_website"></a> [bucket\_website](#input\_bucket\_website) | The bucket website | `bool` | `false` | no |
| <a name="input_bucket_website_cors_rules"></a> [bucket\_website\_cors\_rules](#input\_bucket\_website\_cors\_rules) | default website cors rules | `map(any)` | `{}` | no |
| <a name="input_bucket_website_error_document"></a> [bucket\_website\_error\_document](#input\_bucket\_website\_error\_document) | default website error document | `string` | `"error.html"` | no |
| <a name="input_bucket_website_index_document"></a> [bucket\_website\_index\_document](#input\_bucket\_website\_index\_document) | default website index document | `string` | `"index.html"` | no |
| <a name="input_bucket_website_routing_rules"></a> [bucket\_website\_routing\_rules](#input\_bucket\_website\_routing\_rules) | default website routing rules | `any` | `{}` | no |
| <a name="input_create_public_access_block"></a> [create\_public\_access\_block](#input\_create\_public\_access\_block) | Do you want to create public\_access\_block object. Avoid bc break for existing buckets (set it to false for buckets under or equals to 0.9.16) | `bool` | `true` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | n/a | `map(string)` | <pre>{<br>  "deployed_by": "terraform",<br>  "module_github_repo": "https://github.com/OpenClassrooms/terraform-aws-s3-bucket-module",<br>  "stack": "infra"<br>}</pre> | no |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | Environment variables for lambda function | `map(any)` | `{}` | no |
| <a name="input_sqs_enabled"></a> [sqs\_enabled](#input\_sqs\_enabled) | Do you want your s3 send event in a SQS message | `bool` | `false` | no |
| <a name="input_sqs_queues_config"></a> [sqs\_queues\_config](#input\_sqs\_queues\_config) | The SQS queues configs | `map` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags to apply | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The bucket ARN |
| <a name="output_bucket_regional_domain_name"></a> [bucket\_regional\_domain\_name](#output\_bucket\_regional\_domain\_name) | The bucket\_regional\_domain\_name |
| <a name="output_name"></a> [name](#output\_name) | The bucket name |
| <a name="output_website_endpoint"></a> [website\_endpoint](#output\_website\_endpoint) | The bucket website\_endpoint |
<!-- END_TF_DOCS -->