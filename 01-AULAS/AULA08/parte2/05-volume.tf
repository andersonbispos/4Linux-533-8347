resource "aws_ebs_volume" "disco" {

  availability_zone = var.disco_definicoes_tuple[0]
  type              = var.disco_definicoes_tuple[1]

  size = var.disco_definicoes_tuple[2]

  tags = {
    Name = "web-data01"
  }
}