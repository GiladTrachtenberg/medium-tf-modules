variable "env" {
  description = "Environment name."
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "lambda_arn" {
  description = "Lambda ARN"
  type        = string
}