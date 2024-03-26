data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = data.aws_availability_zones.available.names
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

resource "aws_instance" "web3" {
  ami           = "ami-0e0bf53f6def86294"
  instance_type = "t3.micro"

  subnet_id = module.vpc.public_subnets[0]

  tags = {
    Name = "web3"
  }
}

output "web3_public_ip" {
    value = aws_instance.web3.public_ip  
}