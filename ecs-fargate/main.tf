terraform {
  required_version = ">= 1.3.0"
}

module "ecs_fargate" {
  # This references the official ECS module’s submodule "fargate-service"
  source  = "terraform-aws-modules/ecs/aws//modules/fargate-service"
  version = "~> 4.0"

  name          = var.service_name
  cpu           = var.cpu
  memory        = var.memory
  vpc_id        = var.vpc_id
  subnets       = var.subnet_ids

  container_definitions = jsonencode(var.container_definitions)
}
