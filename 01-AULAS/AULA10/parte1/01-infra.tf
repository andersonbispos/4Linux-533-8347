# git tag -a 1.0 -m "modulo sem security group"
# git tag -a 1.5 -m "modulo com security group"

module "rede" {
  source = "git::https://github.com/andersonbispos/4Linux-533-8347.git//01-AULAS/AULA09/parte02/modulos/redepublica"

  vpc_cidr = "192.168.0.0/16"
  region   = "us-east-2"
}

resource "aws_instance" "web" {
  ami           = "ami-0e0bf53f6def86294"
  instance_type = "t3.micro"

  subnet_id = module.rede.subnet_id

  # vpc_security_group_ids = [aws_security_group.sg_default.id]

  tags = {
    Name = "web"
  }
}