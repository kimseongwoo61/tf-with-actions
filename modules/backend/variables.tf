variable "s3_bucket" {
  description = "S3 bucket name for storing Terraform state"
  type        = string
}

variable "dynamodb_table" {
  description = "DynamoDB table name for state locking"
  type        = string
}

variable "key" {
  description = "Path to the state file inside the S3 bucket"
  type        = string
  default     = "terraform.tfstate"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-northeast-2"
}