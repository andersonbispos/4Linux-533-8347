resource "aws_launch_template" "foo" {
  name = "projeto-template"

  disable_api_stop        = true
  disable_api_termination = true

  image_id = data.aws_ami.ami_amazon_linux.id

  instance_type = "t3.micro"

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "enabled"
  }

  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.sg_default.id]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "projeto-template"
    }
  }

  user_data = filebase64("./scripts/init-script-info.sh")
}