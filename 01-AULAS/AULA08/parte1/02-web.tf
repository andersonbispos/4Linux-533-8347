#https://developer.hashicorp.com/terraform/language/meta-arguments/count

data "aws_ami" "ami_amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["*al2023-ami-2023*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
}

resource "aws_instance" "web1" {
  ami           = var.default_ami
  instance_type = var.default_instance_size

  vpc_security_group_ids = [aws_security_group.allow_default_ports.id]

  user_data = base64encode(var.default_user_data)

  tags = {
    Name = var.web1_name
  }

}

resource "aws_instance" "web2" {
  ami           = var.default_ami
  instance_type = var.default_instance_size

  vpc_security_group_ids = [aws_security_group.allow_default_ports.id]

  user_data = base64encode(var.default_user_data)

  tags = {
    Name = var.web2_name
  }

}
