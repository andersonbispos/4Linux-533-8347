#subnets com indice

resource "aws_subnet" "subnets" {

  count = length(var.subnets_zones_list)

  vpc_id = aws_vpc.tf-vpc-lab.id

  cidr_block = var.subnets_cidr_list[count.index]

  availability_zone       = var.subnets_zones_list[count.index]
  map_public_ip_on_launch = var.public_ip_enabled

  tags = {
    Name = format("subnet-%s-%s", var.vpc_name, var.subnets_zones_list[count.index])
  }

}

resource "aws_route_table_association" "rt_public_subnets_association" {

  count = length(var.subnets_zones_list)

  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.rt_public.id
}