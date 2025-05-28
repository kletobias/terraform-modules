output "bucket_id" {
  description = "The name of the created bucket"
  value       = module.s3_bucket.bucket_id
}

output "arn" {
  description = "The ARN of the bucket"
  value       = module.s3_bucket.arn
}