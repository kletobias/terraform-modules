variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket to create"
}

variable "acl" {
  type        = string
  description = "Canned ACL to apply"
  default     = "private"
}

variable "versioning" {
  type = object({
    enabled = bool
  })
  default = {
    enabled = true
  }
}

variable "force_destroy" {
  type        = bool
  description = "Force destroy bucket?"
  default     = false
}

variable "server_side_encryption_configuration" {
  type = object({
    rule = object({
      apply_server_side_encryption_by_default = object({
        sse_algorithm = string
      })
    })
  })

  default = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }
}

variable "lifecycle_rules" {
  type = list(object({
    id      = string
    enabled = bool
    transition = object({
      days          = number
      storage_class = string
    })
  }))
  default = []
}