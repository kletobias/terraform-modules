terraform {
  required_version = ">= 1.3.0"
}

################
# ECS CLUSTER
################
module "cluster" {
  # git URL + sub-path
  source  = "git::https://github.com/terraform-aws-modules/terraform-aws-ecs.git//modules/cluster?ref=v4.1.3"
  name    = "${var.service_name}-cluster"
}

########################
# FARGATE SERVICE
########################
module "service" {
  # git URL + sub-path
  source  = "git::https://github.com/terraform-aws-modules/terraform-aws-ecs.git//modules/service?ref=v4.1.3"

  # ----- mandatory -----
  name        = var.service_name
  cluster_arn = module.cluster.arn
  launch_type = "FARGATE"

  # ----- networking -----
  subnets          = var.subnet_ids
  assign_public_ip = false

  # ----- task size & scale -----
  cpu           = var.cpu
  memory        = var.memory
  desired_count = 0            # scale-to-zero

  # ----- containers -----
  container_definitions = jsonencode(var.container_definitions)
}
