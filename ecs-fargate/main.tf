terraform {
  required_version = ">= 1.3.0"
}

module "cluster" {
  source  = "git::https://github.com/terraform-aws-modules/terraform-aws-ecs.git//modules/cluster?ref=v4.1.3"
  name    = "${var.service_name}-cluster"
}

module "service" {
  source  = "git::https://github.com/terraform-aws-modules/terraform-aws-ecs.git//modules/service?ref=v4.1.3"

  name            = var.service_name
  cluster_arn     = module.cluster.arn
  launch_type     = "FARGATE"

  subnets          = var.subnet_ids
  assign_public_ip = false

  cpu           = var.cpu
  memory        = var.memory
  desired_count = 0
  container_definitions = jsonencode(var.container_definitions)
}
