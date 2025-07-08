resource "aws_ami_from_instance" "app2_ami" {
  name               = "app2-custom-ami"
  source_instance_id = aws_instance.app2.id
  depends_on         = [aws_instance.app2]
}
