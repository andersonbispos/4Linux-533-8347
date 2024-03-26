data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc_projeto" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc_projeto"
  cidr = "10.0.0.0/16"

  azs            = data.aws_availability_zones.available.names
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}