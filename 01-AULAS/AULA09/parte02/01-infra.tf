module "rede" {
  source = "./modulos/redepublica"

  vpc_cidr = "192.168.0.0/16"
  region   = "us-east-2"
}

resource "aws_instance" "web" {
  ami           = "ami-0e0bf53f6def86294"
  instance_type = "t3.micro"

  subnet_id = module.rede.subnet_id

  vpc_security_group_ids = [aws_security_group.sg_default.id]

  tags = {
    Name = "web"
  }
}

output "web_public_ip" {
  value = aws_instance.web.public_ip
}

output "public_rt_id" {
  value = module.rede.public_route_table_id  
}