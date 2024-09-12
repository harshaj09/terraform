# S3 Bucket

locals {
    # complex expression, used across mulyiple places
  bucket-name = "${var.app_name}-${var.env_name}-bucket" #boutique-dev-bucket
}

resource "aws_s3_bucket" "tf_s3_bucket" {
  bucket = local.bucket-name
  

  tags = {
    Name        = local.bucket-name
    Environment = var.env_name
  }
}