variable "vpc_cidr" {
  description = "Bloco CIDR para ser utilizado ao criar a VPC - formato 192.168.0.0/16"
  type        = string
}

variable "region" {
  description = "regiao onde o ambiente sera provisionado"
  type        = string
}

variable "vpc_name" {
  description = "Nome para ser utilizado ao criar a VPC"
  type        = string
  default     = "vpc_modulo"
}