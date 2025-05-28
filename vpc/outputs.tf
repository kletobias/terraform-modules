output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc_core.vpc_id
}

output "private_subnets" {
  description = "IDs of the private subnets"
  value       = module.vpc_core.private_subnets
}

output "public_subnets" {
  description = "IDs of the public subnets"
  value       = module.vpc_core.public_subnets
}

output "default_security_group_id" {
  description = "The default security group ID"
  value       = module.vpc_core.default_security_group_id
}