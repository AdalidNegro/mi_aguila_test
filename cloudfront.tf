resource "aws_cloudfront_distribution" "mi_aguila_webapp_assets_cdn" {
  origin {
    domain_name = "${aws_s3_bucket.mi_aguila_assets.id}.s3.amazonaws.com"
    origin_id   = aws_s3_bucket.mi_aguila_assets.id

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "match-viewer"
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }

  default_root_object = "index.html"
  enabled             = true
  aliases             = ["${var.aws_region}-${var.environment}-assets.${var.domain}"]

  custom_error_response {
    error_caching_min_ttl = 3000
    error_code            = 404
    response_code         = 200
    response_page_path    = "/index.html"
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.mi_aguila_assets.id

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = "0"
    default_ttl            = "300"
    max_ttl                = "1200"
  }

  is_ipv6_enabled = true
  price_class     = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.mi_aguila_webapp_certificate.arn
    minimum_protocol_version = "TLSv1"
    ssl_support_method       = "sni-only"
  }
}