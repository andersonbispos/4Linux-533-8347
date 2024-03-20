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

# variaveis das instancias

variable "amazon_ami"{
  description = "default_ami"
  type = string
  default = "ami-0e0bf53f6def86294"
}

variable "default_instance_type" { 
  description = "instance_type"
  type = string
  default = "t2.micro"
}

variable "default_user_data" {
  description = "default_user_data"
  type = string
  default = "#!/bin/bash\n sudo yum install nginx -y; sudo systemctl enable nginx; sudo systemctl start nginx"
}