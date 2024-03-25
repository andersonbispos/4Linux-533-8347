# git tag -a 1.0 -m "modulo sem security group"
# git tag -a 1.5 -m "modulo com security group"

module "rede" {
  source = "git::https://github.com/andersonbispos/4Linux-533-8347.git//01-AULAS/AULA09/parte02/modulos/redepublica?ref=1.0"

  vpc_cidr = "192.168.0.0/16"
  region   = "us-east-2"
}

resource "aws_instance" "web" {
  ami           = "ami-0e0bf53f6def86294"
  instance_type = "t3.micro"

  subnet_id = module.rede.subnet_id

  tags = {
    Name = "web"
  }
}

output "web_public_ip" {
  value = aws_instance.web.public_ip
}

module "rede_com_sg" {
  source = "git::https://github.com/andersonbispos/4Linux-533-8347.git//01-AULAS/AULA09/parte02/modulos/redepublica?ref=1.5"

  vpc_cidr = "192.168.0.0/16"
  region   = "us-east-2"
}

resource "aws_instance" "web2" {
  ami           = "ami-0e0bf53f6def86294"
  instance_type = "t3.micro"

  subnet_id = module.rede_com_sg.subnet_id

  vpc_security_group_ids = [module.rede_com_sg.sg_id]

  tags = {
    Name = "web2"
  }
}

output "web2_public_ip" {
  value = aws_instance.web2.public_ip
}