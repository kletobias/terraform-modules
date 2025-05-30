# terraform-modules/ecs-fargate/main.tf  (overwrite the file)

terraform {
  required_version = ">= 1.3.0"
}

################
# ECS cluster  #
################
module "cluster" {
  source  = "git::https://github.com/terraform-aws-modules/terraform-aws-ecs.git//modules/cluster?ref=v4.1.3"
  name    = "${var.service_name}-cluster"
}

########################
# Fargate service      #
########################
module "service" {
  source  = "git::https://github.com/terraform-aws-modules/terraform-aws-ecs.git//modules/service?ref=v4.1.3"

  name          = var.service_name
  cluster_arn   = module.cluster.arn
  launch_type   = "FARGATE"

  cpu           = var.cpu
  memory        = var.memory
  desired_count = 0            # scale-to-zero by default
  subnet_ids    = var.subnet_ids
  assign_public_ip = false

  container_definitions = jsonencode(var.container_definitions)
}
