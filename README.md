# terraform-modules

Reusable, versioned Terraform modules for AWS-based MLOps stacks.

| Module | Purpose |
|--------|---------|
| [s3-bucket](s3-bucket/) | Opinionated, encrypted S3 bucket with lifecycle rules |
| [vpc](vpc/)             | VPC with public/private subnets, optional NAT Gateway |
| [ecs-fargate](ecs-fargate/) | ECS Fargate cluster, service and task definition |

## Quick usage

```hcl
module "s3" {
  source  = "kletobias/s3-bucket/aws"
  version = ">= 0.1.0"

  bucket_name = "my-mlops-bucket"
}

See each module's README for inputs, outputs and examples.

Development

make lint test

