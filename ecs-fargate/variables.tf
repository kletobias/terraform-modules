variable "service_name" {
  type        = string
  description = "Name of the ECS Fargate service"
}

variable "cpu" {
  type        = number
  description = "CPU units for the Fargate service"
  default     = 512
}

variable "memory" {
  type        = number
  description = "Memory (MiB) for the Fargate service"
  default     = 1024
}

variable "vpc_id" {
  type        = string
  description = "output of vpc module: VPC ID to run ECS tasks in"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnets for ECS tasks"
}

variable "container_definitions" {
  type        = list(any)
  description = "Raw container definitions array"
  default     = []
}
