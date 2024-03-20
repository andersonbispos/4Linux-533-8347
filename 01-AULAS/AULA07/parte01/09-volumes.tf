resource "aws_ebs_volume" "web_data01" {
  availability_zone = aws_subnet.subnet_public_2a.availability_zone
  size              = 10
  type              = "gp3"

  tags = {
    Name = "web-data01"
  }
}

resource "aws_volume_attachment" "web_data01_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.web_data01.id
  instance_id = aws_instance.web.id
}