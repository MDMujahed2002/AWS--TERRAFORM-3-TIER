resource "aws_db_instance" "my_rds" {
  identifier              = "my-rds-db"
  engine                  = "mysql"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  username                = var.rds_username
  password                = var.rds_password
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  skip_final_snapshot     = true
  publicly_accessible     = false
  multi_az                = false

  tags = {
    Name = "my-rds-db"
  }
}
