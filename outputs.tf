output "s3_backend_bucket" {
  description = "S3 bucket for Terraform state storage"
  value       = module.s3_backend.bucket_name
}

output "dynamodb_lock_table" {
  description = "DynamoDB table for state locking"
  value       = module.dynamodb_lock.table_name
}

output "backend_instructions" {
  description = "Instructions for using the remote backend"
  value       = <<-EOT
    Backend setup complete!
    
    To use this remote backend:
    1. Run 'terraform init' to initialize the backend
    2. Your state will now be stored in S3: ${module.s3_backend.bucket_name}
    3. State locking is enabled via DynamoDB table: ${module.dynamodb_lock.table_name}
    
    Backend configuration has been generated in backend.tf
  EOT
}