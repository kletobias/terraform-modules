terraform {
    required_version = ">= 1.3.0"
}

module "ecs_fargate" {
    source  = "git::https://github.com/kletobias/terraform-modules.git//ecs-fargate?ref=main"

    # Calls the official ECS Service submodule instead of non-existent fargate-service
    source  = "terraform-aws-modules/ecs/aws//modules/service"
    version = "~> 4.0"

    name                   = var.service_name
    cpu                    = var.cpu
    memory                 = var.memory
    vpc_id                 = var.vpc_id
    subnet_ids             = var.subnet_ids

    container_definitions  = jsonencode(var.container_definitions)
}
