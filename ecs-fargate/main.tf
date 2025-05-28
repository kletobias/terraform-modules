terraform {
  required_version = ">= 1.3.0"
}

module "ecs_fargate" {
  source  = "terraform-aws-modules/ecs-fargate/aws"
  version = "~> 4.0"

  name       = var.service_name
  cpu        = var.cpu
  memory     = var.memory
  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  # Convert the container definitions from a variable to a JSON-encoded string
  container_definitions = jsonencode(var.container_definitions)
}