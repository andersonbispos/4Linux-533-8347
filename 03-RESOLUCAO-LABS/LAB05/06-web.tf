resource "aws_instance" "instance" {

  count = terraform.workspace == "prod" ? 2 : 1

  ami = data.aws_ami.ami_amazon_linux.id

  instance_type = var.instance_types[terraform.workspace]

  associate_public_ip_address = true

  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_default_ports.id]
  user_data              = filebase64("./scripts/init-script-info.sh")

  tags = {
    Name = format("web-%s-%s", count.index, terraform.workspace)
  }
}