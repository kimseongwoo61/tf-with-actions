variable "table_name" {
  description = "Name of the DynamoDB table for state locking"
  type        = string
  default     = "terraform-lock"
}

variable "billing_mode" {
  description = "DynamoDB billing mode"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "tags" {
  description = "Tags to apply to the DynamoDB table"
  type        = map(string)
  default = {
    Name        = "terraform-lock-table"
    Environment = "dev"
    Purpose     = "terraform-state-locking"
  }
}