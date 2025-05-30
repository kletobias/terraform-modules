output "cluster_id" {
  description = "ECS cluster ID"
  value       = module.cluster.arn
}

output "service_id" {
  description = "ECS service name or ARN"
  value       = module.service.service_arn
}

output "task_definition_arn" {
  description = "ARN of the task definition"
  value       = module.service.task_definition_arn
}
