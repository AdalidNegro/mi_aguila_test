resource "aws_lb" "mi_aguila_load_balancer" {
  name               = "${var.aws_region}_${var.environment}_mi_aguila_load_balancer"
  internal           = true
  load_balancer_type = "network"
  subnets            = [aws_subnet.private_subnet_a.id, aws_subnet.private_subnet_b.id]

  tags = {
    Environment = var.environment
  }
}

resource "aws_lb_target_group" "mi_aguila_target_group" {
  count       = 3
  name        = "${var.aws_region}_${var.environment}_mi_aguila_target_group"
  port        = var.ports_list[count.index]
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
  port              = var.ports_list[count.index]
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.mi_aguila_target_group.id
    type             = "forward"
  }
}