resource "aws_lb" "mi_aguila_load_balancer" {
  name               = "${var.aws_region}-${var.environment}-mi-aguila-balancer"
  internal           = true
  load_balancer_type = "network"
  subnets            = [aws_subnet.private_subnet_a.id, aws_subnet.private_subnet_b.id]

  tags = {
    Environment = var.environment
  }
}

resource "aws_lb_target_group" "mi_aguila_target_group" {
  name        = "${var.aws_region}-${var.environment}-target-group"
  port        = 3000
  protocol    = "TCP"
  vpc_id      = aws_vpc.mi_aguila.id
  target_type = "ip"

  stickiness {
    enabled = false
    type    = "lb_cookie"
  }

  depends_on = ["aws_lb.mi_aguila_load_balancer"]
}

resource "aws_lb_listener" "mi_aguila_listener" {
  load_balancer_arn = aws_lb.mi_aguila_load_balancer.id
  port              = 3000
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.mi_aguila_target_group.id
    type             = "forward"
  }
}