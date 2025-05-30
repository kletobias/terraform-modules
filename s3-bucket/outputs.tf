output "bucket_id" {
  value       = module.s3_bucket.bucket_id   # ✔
  description = "Bucket name"
}

output "bucket_arn" {
  value       = module.s3_bucket.bucket_arn  # ✔ (not `arn`)
  description = "Bucket ARN"
}
