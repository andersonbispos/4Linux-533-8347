resource "aws_autoscaling_group" "asg_projeto" {

  name = "projeto_asg"

  desired_capacity = 3
  max_size         = 3
  min_size         = 1

  health_check_type = "ELB"

  vpc_zone_identifier = module.vpc_projeto.public_subnets

  # availability_zones = ["us-east-1a"]

  launch_template {
    id      = aws_launch_template.foo.id
    version = "$Latest"
  }
}