# terraform-modules/ecs-fargate/main.tf
terraform {
  required_version = ">= 1.3.0"
}

##########
# CLUSTER
##########
module "cluster" {
  source  = "terraform-aws-modules/ecs/aws//modules/cluster"
  version = "~> 4.1"

  name = "${var.service_name}-cluster"
}

#####################
# FARGATE SERVICE
#####################
module "service" {
  source  = "terraform-aws-modules/ecs/aws//modules/service"
  version = "~> 4.1"

  name            = var.service_name
  cluster_arn     = module.cluster.arn
  launch_type     = "FARGATE"

  cpu             = var.cpu
  memory          = var.memory
  desired_count   = 0                        # scale-to-zero by default
  subnet_ids      = var.subnet_ids
  assign_public_ip = false

  task_exec_iam_role_arn = null             # use default if you don’t pass one
  task_role_arn          = null

  container_definitions  = jsonencode(var.container_definitions)
}
