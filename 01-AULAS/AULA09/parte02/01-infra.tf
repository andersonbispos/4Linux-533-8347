module "rede" {
  source = "./modulos/redepublica"

  vpc_cidr = "192.168.0.0/16"
  region   = "us-east-2"
}

resource "aws_instance" "web" {
  ami           = "ami-0e0bf53f6def86294"
  instance_type = "t3.micro"

  subnet_id = module.rede.aws_subnet.subnet_public.id

  # vpc_security_group_ids = ["sg-079711cb02c0b71b2"]

  tags = {
    Name = "web"
  }
}

