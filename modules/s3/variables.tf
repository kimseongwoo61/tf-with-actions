variable "bucket_name" {
  description = "S3 bucket name for storing Terraform state"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the S3 bucket"
  type        = map(string)
  default = {
    Name        = "terraform-state-bucket"
    Environment = "dev"
    Purpose     = "terraform-backend"
  }
}