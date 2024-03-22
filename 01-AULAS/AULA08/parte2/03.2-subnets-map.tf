resource "aws_subnet" "subnets" {

  for_each = var.map_subnets_zone_cidr

  vpc_id = aws_vpc.tf-vpc-lab.id

  cidr_block = each.value

  availability_zone       = each.key
  map_public_ip_on_launch = var.public_ip_enabled

  tags = {
    Name = format("subnet-%s-%s", var.vpc_name, each.key)
  }

}

#subnets com maps

# resource "aws_subnet" "subnet0" {

#   vpc_id = aws_vpc.tf-vpc-lab.id

#   cidr_block = var.subnets_cidr_map["subnet0"]

#   availability_zone       = var.subnets_zone_map["subnet0"]
#   map_public_ip_on_launch = var.public_ip_enabled

#   tags = {
#     Name = format("subnet-%s-%s", var.vpc_name, var.subnets_zone_map["subnet0"])
#   }

# }

# resource "aws_subnet" "subnet1" {

#   vpc_id = aws_vpc.tf-vpc-lab.id

#   cidr_block = var.subnets_cidr_map["subnet1"]

#   availability_zone       = var.subnets_zone_map["subnet1"]
#   map_public_ip_on_launch = var.public_ip_enabled

#   tags = {
#     Name = format("subnet-%s-%s", var.vpc_name,var.subnets_zone_map["subnet1"])
#   }

# }


# resource "aws_route_table_association" "rt_public_subnets_association" {

#   count = length(var.subnets_zones_list)

#   subnet_id      = aws_subnet.subnets[count.index].id
#   route_table_id = aws_route_table.rt_public.id
# }