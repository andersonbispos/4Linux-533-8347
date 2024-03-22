resource "aws_ebs_volume" "disco_tuple" {

  availability_zone = var.disco_definicoes_tuple[0]
  type              = var.disco_definicoes_tuple[1]

  size = var.disco_definicoes_tuple[2]

  tags = {
    Name = "disco-tupla"
  }
}

resource "aws_ebs_volume" "disco_object" {

  availability_zone = var.disco_definicoes_object["zona"]
  type              = var.disco_definicoes_object["tipo"]

  size = var.disco_definicoes_object["size"]

  tags = {
    Name = "disco-object"
  }
}