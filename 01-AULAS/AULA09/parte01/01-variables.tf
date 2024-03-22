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
    dev = "192.168.0.0/16"
    prod = "172.16.0.0/16"
  }
}
## variaveis das subnets - simples

variable "public_ip_enabled" {
  description = "Define se a subnet deve habilitar por padrão ips publicos"
  type        = bool
  default     = true
}

## variaveis das subnets - map

variable "subnets_cidr_map" {
  description = "Bloco CIDR para ser utilizado nas subnets"
  type        = map(string)
  default = {
    subnet0 = "192.168.10.0/24"
    subnet1 = "192.168.20.0/24"
  }
}

variable "subnets_zone_map" {
  description = "Lista de Zonas onde serão criadas as subnets"
  type        = map(string)
  default = {
    subnet0 = "us-east-2a"
    subnet1 = "us-east-2b"
  }
}

variable "map_subnets_zone_cidr" {
  description = "Lista de Zonas onde serão criadas as subnets"
  type        = map(string)
  default = {
    us-east-2a = "192.168.10.0/24"
    us-east-2b = "192.168.20.0/24"
  }
}

## exemplo pratico de map

variable "instance_sizes" {
  description = "tamanhos de instancias na AWS"
  type        = map(string)
  default = {
    cpu2ram2    = "t3a.small"
    cpu2ram4    = "t3a.medium"
    cpu2ram8    = "t3a.large"
    cpu4ram16   = "t3a.xlarge"
    cpu8ram32   = "t3a.2xlarge"
    cpu16ram64  = "m5a.4xlarge"
    cpu32ram128 = "m5a.8xlarge"
  }
}

## definindo os paramentros do disco

variable "disco_definicoes_tuple" {
  type    = tuple([string, string, number])
  default = ["us-east-2c", "gp3", 20]
}

variable "disco_definicoes_object" {
  type = object(
    { zona = string,
      tipo = string,
  size = number })
  default = {
    zona = "us-east-2c"
    tipo = "gp3"
    size = 30
  }
}