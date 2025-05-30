terraform {
  required_version = ">= 1.3.0"
}

################
# ECS cluster  #
################
module "cluster" {
  source  = "terraform-aws-modules/ecs/aws//modules/cluster"
  version = "~> 4.1"

  name = "${var.service_name}-cluster"
}

########################
# Fargate service      #
########################
module "service" {
  source  = "terraform-aws-modules/ecs/aws//modules/service"
  version = "~> 4.1"

  name            = var.service_name
  cluster_arn     = module.cluster.arn
  launch_type     = "FARGATE"

  cpu             = var.cpu
  memory          = var.memory
  desired_count   = 0              # scale-to-zero by default
  subnet_ids      = var.subnet_ids
  assign_public_ip = false

  container_definitions = jsonencode(var.container_definitions)
}
