output "web1_availability_zone" {
  description = "web1_availability_zone"
  value       = aws_instance.web1.availability_zone
}

output "web1_private_ip" {
  description = "ip privado da instancia web"
  value       = aws_instance.web1.private_ip
}

output "web1_public_ip" {
  description = "web_public_ip"
  value       = aws_instance.web1.public_ip
}

output "web2_availability_zone" {
  description = "web2_availability_zone"
  value       = aws_instance.web2.availability_zone
}

output "web2_private_ip" {
  description = "ip privado da instancia web2"
  value       = aws_instance.web2.private_ip
}

output "web2_public_ip" {
  description = "web2_public_ip"
  value       = aws_instance.web2.public_ip
}

output "dbserver1_availability_zone" {
  description = "dbserver1_availability_zone"
  value       = aws_instance.dbserver1.availability_zone
}

output "dbserver1_private_ip" {
  description = "ip privado da instancia web"
  value       = aws_instance.dbserver1.private_ip
}

output "dbserver1_public_ip" {
  description = "web_public_ip"
  value       = aws_instance.dbserver1.public_ip
}
