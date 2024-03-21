locals {
  db_zone             = "sa-east-1c"
  local_db_zone       = var.subnet2_zone
  subnet2_name_concat = format("subnet-%s-%s", var.vpc_name, var.subnet2_zone)
  subnet2_name_format = "subnet-${var.vpc_name}-${var.subnet2_zone}"
}