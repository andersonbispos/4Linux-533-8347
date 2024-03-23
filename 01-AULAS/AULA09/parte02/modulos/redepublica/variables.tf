variable "vpc_cidr" {
  description = "Bloco CIDR para ser utilizado ao criar a VPC - formato 192.168.0.0/16"
  type        = string
}

variable "vpc_name" {
  description = "Nome para ser utilizado ao criar a VPC"
  type        = string
  default     = "vpc_modulo"
}

variable "subnet_zone" {
  description = "zona para ser utilizado ao criar a subnet"
  type        = string
  default     = "us-east-2a"
}