resource "aws_instance" "web" {
  ami           = var.amazon_ami
  instance_type = var.default_instance_type

  subnet_id = aws_subnet.subnet_public_2a.id

  vpc_security_group_ids = [ aws_security_group.sg_default.id ]

  user_data = base64encode(var.default_user_data)

  tags = {
    Name = "web1"
  }

  depends_on = [ aws_instance.db ]
}