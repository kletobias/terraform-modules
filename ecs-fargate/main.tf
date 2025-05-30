terraform {
  required_version = ">= 1.3.0"
}

########################
# 1. ECS CLUSTER
########################
module "cluster" {
  # root module – *no* sub-dir
  source  = "git::https://github.com/terraform-aws-modules/terraform-aws-ecs.git?ref=v4.1.3"

  # the only two variables we really need
  create_cluster = true
  cluster_name   = "${var.service_name}-cluster"

  # turn off features we don’t need in a demo
  create_capacity_providers = false
  create_cloudwatch_log_group = false
}

########################
# 2. FARGATE SERVICE
########################
module "service" {
  source  = "git::https://github.com/terraform-aws-modules/terraform-aws-ecs.git//modules/service?ref=v4.1.3"

  name        = var.service_name
  cluster_arn = module.cluster.cluster_arn      # ← output name in root module
  launch_type = "FARGATE"

  subnets          = var.subnet_ids
  assign_public_ip = false

  cpu           = var.cpu
  memory        = var.memory
  desired_count = 0                              # scale-to-zero

  container_definitions = jsonencode(var.container_definitions)
}
