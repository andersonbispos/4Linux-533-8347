resource "aws_instance" "web" {

  count = "${terraform.workspace == "prod" ? 0 : 2}"

  ami           = data.aws_ami.ami_amazon_linux.id

  instance_type = var.instance_types[terraform.workspace]

  vpc_security_group_ids = [ aws_security_group.allow_default_ports[0].id ]

  tags = {
    Name = "web-${count.index}-${terraform.workspace}"
  }
}