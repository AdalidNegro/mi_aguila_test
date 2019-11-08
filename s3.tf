resource "aws_s3_bucket" "mi_aguila_assets" {
  bucket        = "${var.aws_region}-${var.environment}-mi-aguila-assets-bucket"
  force_destroy = true

  tags = {
    Name = "${var.aws_region}-${var.environment} Mi Aguila Assets Bucket"
  }
}

resource "aws_s3_bucket" "mi_aguila_webapp_logs" {
  bucket        = "${var.aws_region}-${var.environment}-webapp-logs"
  acl           = "log-delivery-write"
  force_destroy = true
}

resource "aws_s3_bucket" "mi_aguila_webapp" {
  bucket        = "${var.aws_region}-${var.environment}-mi-aguila-webapp-bucket"
  acl           = "public-read"
  force_destroy = true

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

  logging {
    target_bucket = aws_s3_bucket.mi_aguila_webapp_logs.bucket
    target_prefix = ".agl"
  }

  website {
    index_document = "index.html"
    error_document = "404.html"
  }

  tags = {
    Name = "${var.aws_region} ${var.environment} Mi Aguila Webapp Bucket"
  }
}