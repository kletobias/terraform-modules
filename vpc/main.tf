terraform {
  required_version = ">= 1.3.0"
}

# This module uses the official Terraform AWS VPC module internally
module "vpc_core" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.14"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway   = var.enable_nat_gateway
  enable_dns_hostnames = true
  enable_dns_support   = true
}