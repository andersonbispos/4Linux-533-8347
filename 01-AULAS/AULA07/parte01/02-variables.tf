## definindo variaveis
## parametro -var - ex.: terraform plan -var="vpc_cidr=192.168.10.0/24"
## variavel de ambiente TF_VAR_ - ex.: export TF_VAR_vpc_name=vpc_terraform

# variaveis da vpc

variable "vpc_cidr" {
  description = "Valor CIDR da vpc - ex.: 192.168.0.0/16"
  type        = string
  default     = "10.10.0.0/16"
}

variable "vpc_name" {
  description = "Nome da VPC"
  type        = string
}

# variaveis das subnets

variable "subnet_zone" {
  description = "zona das subnets"
  type        = string
  default     = "us-east-2a"
}

variable "public_cidr" {
  description = "public_cidr"
  type        = string
  default     = "10.10.1.0/24"
}

variable "private_cidr" {
  description = "private_cidr"
  type        = string
  default     = "10.10.2.0/24"
}
