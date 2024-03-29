resource "aws_security_group" "allow_default_ports" {
  name        = format("allow_default_ports_%s_sg", var.vpc_name)
  description = format("allow_default_ports_%s_sg", var.vpc_name)

  vpc_id = aws_vpc.tf-vpc-lab.id

  ingress {
    description = "Allow ICMP"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = format("allow_default_ports_%s_sg", var.vpc_name)
  }
}