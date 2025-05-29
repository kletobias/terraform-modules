# s3-bucket/main.tf

terraform {
  required_version = ">= 1.3.0"
}

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 3.1"

  bucket        = var.bucket_name
  acl           = var.acl
  versioning    = var.versioning
  force_destroy = var.force_destroy

  server_side_encryption_configuration = var.server_side_encryption_configuration
  lifecycle_rule                       = var.lifecycle_rules
}
