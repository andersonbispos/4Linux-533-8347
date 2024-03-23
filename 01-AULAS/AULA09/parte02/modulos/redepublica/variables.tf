variable "vpc_name" {
  description = "Nome para ser utilizado ao criar a VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "Bloco CIDR para ser utilizado ao criar a VPC"
  type        = string
  default     = "192.168.0.0/16"
}
