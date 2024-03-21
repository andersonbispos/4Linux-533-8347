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
  type        = bool
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
}#

variable "subnet2_zone" {
  description = "Zone em que sera criada a subnet2"
  type        = string
  default     = "sa-east-1c"
}

## NAO EH PERMITIDO REFERENCIAR UMA VARIAVEL AO SE DEFINIR OUTRA VARIAVEL
# variable "subnet2_name" {
#   description = "subnet2_name"
#   type        = string
# #  default     = format("subnet-%s-%s", var.vpc_name, var.subnet2_zone) <- nao permitido aqui
#   default     = "subnet-${var.vpc_name}-${var.subnet2_zone}" <- não é permitido
# }

## variaveis de processamento

variable "volume_size" {
  description = "volume_size"
  type        = number
  default     = 10

  validation {
    condition     = var.volume_size <= 50
    error_message = "o tamanho do volume deve ser menor que 50G"
  }
}

variable "default_ami" {
  description = "default_ami"
  type = string
  default = "ami-08af887b5731562d3"
}

variable "default_instance_size" {
  description = "default_instance_size"
  type = string
  default = "t3.micro"
}

variable "default_user_data" {
  description = "default_user_data"
  type        = string
  default     = "#!/bin/bash\n sudo apt update; sudo apt install nginx -y"
}

variable "web1_name" {
  description = "web1_name"
  type        = string
  default     = "web1"
}

variable "web2_name" {
  description = "web2_name"
  type        = string
  default     = "web2"
}

variable "dbserver1_name" {
  description = "dbserver1_name"
  type        = string
  default     = "dbserver1"
}