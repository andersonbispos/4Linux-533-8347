resource "aws_vpc" "vpc_terraform" {

  cidr_block = var.vpc_cidr[terraform.workspace]

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.vpc_name}-${terraform.workspace}"
  }
}