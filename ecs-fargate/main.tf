# terraform-modules/ecs-fargate/main.tf
terraform {
  required_version = ">= 1.3.0"
}

module "service" {
  source  = "terraform-aws-modules/ecs/aws//modules/service"
  version = "~> 4.1"

  ###########################
  # Cluster & networking
  ###########################
  create_cluster  = true
  cluster_name    = "${var.service_name}-cluster"
  launch_type     = "FARGATE"
  subnets         = var.subnet_ids
  assign_public_ip = false

  ###########################
  # Task / service settings
  ###########################
  name          = var.service_name
  cpu           = var.cpu
  memory        = var.memory
  desired_count = 0                           # scale-to-zero

  container_definitions = jsonencode(var.container_definitions)
}
