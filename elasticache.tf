resource "aws_elasticache_cluster" "mi_aguila_cache" {
  cluster_id           = "${var.aws_region}_${var.environment}_cache"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  engine_version       = "3.2.10"
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.mi_aguila_subnet_group.name
}