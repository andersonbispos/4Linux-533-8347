data "aws_ebs_volume" "web_data02" {
  most_recent = true

  filter {
    name   = "volume-type"
    values = ["gp3"]
  }

  filter {
    name   = "size"
    values = ["50"]
  }

  filter {
    name   = "tag:origem"
    values = ["banco-replica-01"]
  }
}

resource "aws_volume_attachment" "web_data02_att" {
  device_name = "/dev/sdj"
  volume_id   = data.aws_ebs_volume.web_data02.id
  instance_id = aws_instance.web.id
}