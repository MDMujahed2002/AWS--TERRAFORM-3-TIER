resource "aws_launch_template" "web_lt" {
  name_prefix   = "web1-lt-"
  image_id      = aws_ami_from_instance.web1_ami.id
  instance_type = "t2.micro"
  key_name      = "WEB-TIER"

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "web-from-ami"
    }
  }
}
