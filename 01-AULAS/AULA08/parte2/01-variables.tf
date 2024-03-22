## variaveis da VPC

variable "vpc_name" {
  description = "Nome para ser utilizado ao criar a VPC"
  type        = string
  default     = "vpc_aula08"
}

variable "vpc_cidr" {
  description = "Bloco CIDR para ser utilizado ao criar a VPC"
  type        = string
  default     = "192.168.0.0/16"
}

## variaveis das subnets - simples

variable "public_ip_enabled" {
  description = "Define se a subnet deve habilitar por padrão ips publicos"
  type        = bool
  default     = true
}

variable "subnet1_cidr" {
  description = "Bloco CIDR para ser utilizado na subnet1"
  type        = string
  default     = "192.168.10.0/24"
}

variable "subnet1_zone" {
  description = "Zone em que sera criada a subnet1"
  type        = string
  default     = "us-east-2b"
}

variable "subnet2_cidr" {
  description = "Bloco CIDR para ser utilizado na subnet2"
  type        = string
  default     = "192.168.20.0/24"
} #

variable "subnet2_zone" {
  description = "Zone em que sera criada a subnet2"
  type        = string
  default     = "us-east-2c"
}

## variaveis das subnets - list

variable "subnets_cidr_list" {
  description = "Bloco CIDR para ser utilizado nas subnets"
  type        = list(string)
  default     = ["192.168.10.0/24", "192.168.20.0/24", "192.168.30.0/24"]
}

variable "subnets_zones_list" {
  description = "Lista de Zonas onde serão criadas as subnets"
  type        = list(string)
  default     = ["us-east-2b", "us-east-2c", "us-east-2a"]
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