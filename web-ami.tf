resource "aws_ami_from_instance" "web1_ami" {
  name               = "web1-custom-ami"
  source_instance_id = aws_instance.web1.id
  depends_on         = [aws_instance.web1]
}
