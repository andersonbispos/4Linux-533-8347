resource "aws_lb" "projeto" {
  name               = "projeto-4linux"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_default.id]
  subnets            = module.vpc_projeto.public_subnets
}

resource "aws_lb_target_group" "projeto" {
  name     = "projeto-4linux"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc_projeto.vpc_id
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.projeto.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.projeto.arn
  }
}

resource "aws_autoscaling_attachment" "projeto" {
  autoscaling_group_name = aws_autoscaling_group.asg_projeto.id
  lb_target_group_arn    = aws_lb_target_group.projeto.arn
}

output "alb_address" {
    value = aws_lb.projeto.dns_name  
}