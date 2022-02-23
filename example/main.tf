
module "my_example_module" {
  source            = "../" # in this example, this is a local module. For real use, source will be "OpenClassrooms/lambda-apigw-module/aws"
  bucket_name       = "test_bucket"
  bucket_acl        = "private"
  bucket_versioning = true

  bucket_lifecycle_configuration_rules = [
    {
    id = "test_bucket"

    status = "Enabled"

    transition = [
      {
        days          = 60
        storage_class = "GLACIER"
      }
    ]

    expiration = [
      {
        days = 300
      }
    ]
  }
  ]

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

  tags = var.tags
}
