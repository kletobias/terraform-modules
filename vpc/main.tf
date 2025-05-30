terraform {
  required_version = ">= 1.3.0" # Minimum required Terraform version
}

# This module uses the official Terraform AWS VPC module internally
module "vpc_core" {
  source  = "terraform-aws-modules/vpc/aws" # Source of the VPC module
  version = "~> 3.14"                       # Specify the version of the VPC module

  name = var.vpc_name # Name for the VPC
  cidr = var.vpc_cidr # CIDR block for the VPC

  azs             = var.azs             # Availability Zones for the VPC
  private_subnets = var.private_subnets # Private subnet CIDRs
  public_subnets  = var.public_subnets  # Public subnet CIDRs

  enable_nat_gateway   = var.enable_nat_gateway # Enable NAT Gateway or not
  enable_dns_hostnames = true                   # Enable DNS hostnames in the VPC
  enable_dns_support   = true                   # Enable DNS support in the VPC
}
