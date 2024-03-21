resource "aws_instance" "web1" {
  ami           = var.default_ami
  instance_type = var.default_instance_size

  subnet_id = aws_subnet.subnet1.id

  vpc_security_group_ids = [aws_security_group.allow_default_ports.id]

  user_data = base64encode(var.default_user_data)

  tags = {
    Name = var.web1_name
  }

  depends_on = [aws_instance.dbserver1]
}

resource "aws_instance" "web2" {
  ami           = var.default_ami
  instance_type = var.default_instance_size

  subnet_id = aws_subnet.subnet2.id

  vpc_security_group_ids = [aws_security_group.allow_default_ports.id]

  user_data = base64encode(var.default_user_data)

  tags = {
    Name = var.web2_name
  }

  depends_on = [aws_instance.dbserver1]
}
