terraform {
  required_version = ">= 1.3.0"
}

################
# ECS CLUSTER
################
module "cluster" {
  source  = "terraform-aws-modules/ecs/aws//modules/cluster"
  version = "~> 4.1"

  name = "${var.service_name}-cluster"
}

############################
# FARGATE SERVICE
############################
module "service" {
  source  = "terraform-aws-modules/ecs/aws//modules/service"
  version = "~> 4.1"

  # ---- mandatory ----
  name        = var.service_name
  cluster_arn = module.cluster.arn
  launch_type = "FARGATE"

  # ---- networking ----
  subnets         = var.subnet_ids
  assign_public_ip = false

  # ---- task size & scale ----
  cpu           = var.cpu
  memory        = var.memory
  desired_count = 0           # scale-to-zero by default

  # ---- containers ----
  container_definitions = jsonencode(var.container_definitions)
}
