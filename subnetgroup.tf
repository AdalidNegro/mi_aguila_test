resource "aws_elasticache_subnet_group" "mi_aguila_subnet_group" {
  name = "${var.aws_region}_${var.environment}_mi_aguila_-cache_subnet_group"
  subnet_ids = [
    aws_subnet.private_subnet_a.id,
    aws_subnet.private_subnet_b.id]
}