output "backend_config_file" {
  description = "Path to the generated backend configuration file"
  value       = local_file.backend_config.filename
}

output "s3_bucket" {
  description = "S3 bucket used for backend"
  value       = var.s3_bucket
}

output "dynamodb_table" {
  description = "DynamoDB table used for state locking"
  value       = var.dynamodb_table
}