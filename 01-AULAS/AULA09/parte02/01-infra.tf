module "rede" {
  source = "./modulos/redepublica"

  vpc_cidr = "192.168.0.0/16"
  region   = "us-east-2"
}