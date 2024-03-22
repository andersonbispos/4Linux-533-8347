variable "ambientes" {
  description = "Definicao das regioes por ambiente"
  type        = map(string)
  default = {
    "dev"  = "us-east-2"
    "prod" = "sa-east-1"
  }
}

## variaveis da VPC

variable "vpc_name" {
  description = "Nome para ser utilizado ao criar a VPC"
  type        = string
  default     = "vpc_aula09"
}

variable "vpc_cidr" {
  description = "Bloco CIDR para ser utilizado nas subnets"
  type        = map(string)
  default = {
    dev  = "172.16.0.0/16"
    prod = "192.168.0.0/16"
  }
}

variable "instance_images" {
  description = "Imagem da instancia"
  type        = map(string)
  default = {
    dev  = "ami-06e46074ae430fba6" # <- Amazon Linux - us-east-1
    prod = "ami-01f451f00dae38302" # <- Amazon Linux - sa-east-1
  }
}

variable "instance_types" {
  description = "Tamanho da instancia"
  type        = map(string)
  default = {
    dev  = "t3a.micro"
    prod = "t3a.medium"
  }
}