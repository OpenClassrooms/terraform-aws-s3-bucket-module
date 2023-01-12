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
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.1.2 |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | >= 4.2   |
