resource "aws_launch_template" "app_lt" {
  name_prefix   = "app2-lt-"
  image_id      = aws_ami_from_instance.app2_ami.id
  instance_type = "t2.micro"
  key_name      = "WEB-TIER"

  vpc_security_group_ids = [aws_security_group.app_sg.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "app-asg-instance"
    }
  }
}
