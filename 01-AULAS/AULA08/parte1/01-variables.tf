variable "qtd_vms" {
    description = "Quantas WEBs devo criar"
    type = number
    default = 4
}

variable "default_instance_size" {
  description = "default_instance_size"
  type = string
  default = "t3.micro"
}

variable "default_user_data" {
  description = "default_user_data"
  type        = string
  default     = "#!/bin/bash\n sudo yum install nginx -y; sudo systemctl enable nginx; sudo systemctl start nginx"
}

variable "web_modelo" {
  description = "web_modelo"
  type        = string
  default     = "web_modelo"
}