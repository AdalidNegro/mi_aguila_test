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
  count = length(var.ports_list)
  name        = "${var.aws_region}-${element(var.ec2_list, count.index)}-target-group"
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
  count = length(var.ports_list)
  load_balancer_arn = aws_lb.mi_aguila_load_balancer.id
  port              = var.ports_list[count.index]
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.mi_aguila_target_group[count.index].id
    type             = "forward"
  }
}