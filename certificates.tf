resource "aws_acm_certificate" "mi_aguila_webapp_certificate" {
  domain_name       = "miaguila.com"
  validation_method = "DNS"

  tags = {
    Environment = "dev"
  }

  lifecycle {
    create_before_destroy = true
  }
}