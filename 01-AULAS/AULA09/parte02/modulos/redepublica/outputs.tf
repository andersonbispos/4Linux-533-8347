output "vpc_id" {
    description = "vpc_id"
    value = aws_vpc.vpc_4linux.id
}

output "subnet_id" {
    description = "subnet_id"
    value = aws_subnet.subnet_public.id
}

output "public_route_table_id" {
    description = "public_route_table_id"
    value = aws_route_table.rt_public.id  
}

output "sg_id" {
    description = "sg_id"
    value = aws_security_group.sg_default.id  
}