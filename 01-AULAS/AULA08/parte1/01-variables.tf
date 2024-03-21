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