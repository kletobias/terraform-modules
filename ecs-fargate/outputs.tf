output "cluster_id" {
  description = "ECS cluster ID"
  value       = module.ecs_fargate.cluster_id
}

output "service_id" {
  description = "ECS service name or ARN"
  value       = module.ecs_fargate.service_id
}

output "task_definition_arn" {
  description = "ARN of the task definition"
  value       = module.ecs_fargate.task_definition_arn
}