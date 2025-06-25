# 버킷 이름 중복 방지를 위한 랜덤 문자열
resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

# S3 백엔드 버킷 생성
module "s3_backend" {
  source      = "./modules/s3"
  bucket_name = "my-terraform-state-bucket-${random_string.bucket_suffix.result}"
}

# DynamoDB 테이블 생성 (상태 잠금용)
module "dynamodb_lock" {
  source     = "./modules/dynamodb"
  table_name = "terraform-lock"
}

# 백엔드 설정 모듈
module "backend_config" {
  source           = "./modules/backend"
  s3_bucket        = module.s3_backend.bucket_name
  dynamodb_table   = module.dynamodb_lock.table_name
  
  depends_on = [
    module.s3_backend,
    module.dynamodb_lock
  ]
}