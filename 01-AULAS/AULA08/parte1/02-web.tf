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

resource "aws_instance" "web_modelo" {

  count = var.qtd_vms

  ami           = data.aws_ami.ami_amazon_linux.id
  instance_type = var.default_instance_size

  vpc_security_group_ids = [aws_security_group.allow_default_ports.id]

  user_data = base64encode(var.default_user_data)

  tags = {
    # Name = "${var.web_modelo}_${count.index}"
    Name = format("%s_%s", var.web_modelo, count.index )
  }

}

output "webs_publics_names" {
  value = aws_instance.web_modelo[*].tags.Name
}

output "webs_publics_ips" {
  value = aws_instance.web_modelo[*].public_ip
}

## outputs individuais
# output "web0" {
#   value = aws_instance.web_modelo[0].public_ip
# }

# output "web1" {
#   value = aws_instance.web_modelo[1].public_ip
# }