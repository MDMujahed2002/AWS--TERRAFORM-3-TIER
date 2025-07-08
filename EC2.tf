resource "aws_instance" "web1" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_1.id
  key_name = "WEB-TIER"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  user_data                   = file("user-data.sh")

  tags = {
    Name = "web1"
  }
}

resource "aws_instance" "web2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_2.id
  key_name = "WEB-TIER"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  user_data                   = file("user-data2.sh")

  tags = {
    Name = "web2"
  }
}

# App Instances
resource "aws_instance" "app1" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.private_1.id
  key_name = "WEB-TIER"
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.app_sg.id]
  user_data = file("mysql.sh")
  tags = {
    Name = "app1"
  }
}

resource "aws_instance" "app2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.private_2.id
  key_name = "WEB-TIER"
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.app_sg.id]
  user_data = file("mysql.sh")
  tags = {
    Name = "app2"
  }
}
