#creating External LoadBalancer

resource "aws_lb" "external-alb" {
  name               = "external-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.websg.id]
  subnets            = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]
}
resource "aws_lb_target_group" "target_servers" {
  name     = "target-server"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.myvpc.id
}
resource "aws_lb_target_group_attachment" "attachment" {
  target_group_arn = aws_lb_target_group.target_servers.arn
  target_id        = aws_instance.myinstance1[0].id
  port             = 80
  depends_on       = [aws_instance.myinstance1]
}

resource "aws_lb_target_group_attachment" "attachment2" {
  target_group_arn = aws_lb_target_group.target_servers.arn
  target_id        = aws_instance.myinstance2[0].id
  port             = 80
  depends_on       = [aws_instance.myinstance2]
}

resource "aws_lb_listener" "frontend" {
  load_balancer_arn = aws_lb.external-alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_servers.arn
  }
}
