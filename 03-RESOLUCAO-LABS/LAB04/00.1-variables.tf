## variaveis da VPC

variable "vpc_name" {
  description = "Nome para ser utilizado ao criar a VPC"
  type        = string
  default     = "tf-vpc-lab"
}

variable "vpc_cidr" {
  description = "Bloco CIDR para ser utilizado ao criar a VPC"
  type        = string
  default     = "192.168.0.0/16"
}

## variaveis das subnets

variable "public_ip_enabled" {
    description = "Define se a subnet deve habilitar por padrão ips publicos"
    type = bool
}

variable "subnet1_cidr" {
  description = "Bloco CIDR para ser utilizado na subnet1"
  type        = string
  default     = "192.168.10.0/24"
}

variable "subnet1_zone" {
  description = "Zone em que sera criada a subnet1"
  type        = string
  default     = "sa-east-1b"
}

variable "subnet2_cidr" {
  description = "Bloco CIDR para ser utilizado na subnet2"
  type        = string
  default     = "192.168.20.0/24"
}

variable "subnet2_zone" {
  description = "Zone em que sera criada a subnet2"
  type        = string
  default     = "sa-east-1c"
}