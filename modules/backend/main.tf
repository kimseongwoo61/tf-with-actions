# 백엔드 설정을 위한 템플릿 파일 생성
resource "local_file" "backend_config" {
  content = templatefile("${path.module}/backend.tf.tpl", {
    bucket         = var.s3_bucket
    key            = var.key
    region         = var.region
    dynamodb_table = var.dynamodb_table
  })
  filename = "${path.root}/backend.tf"
}