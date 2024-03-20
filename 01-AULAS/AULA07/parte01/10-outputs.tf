output "web_private_ip" {
  description = "ip privado da instancia web"
  value       = aws_instance.web.private_ip
  sensitive   = true
}

output "web_public_ip" {
  description = "web_public_ip"
  value       = aws_instance.web.public_ip

}
