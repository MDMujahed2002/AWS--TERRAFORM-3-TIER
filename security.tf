resource "aws_security_group" "web_sg" {
    vpc_id = aws_vpc.myvpc.id
    name = "web-sg"
    ingress{
        description = "allow ssh"
        from_port=22
        to_port=22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress{
        description = "allow http"
        from_port=80
        to_port=80
        protocol="tcp"
        cidr_blocks =["0.0.0.0/0"]
    }
    egress{
        description = "allow all traffic"
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]

    }

}
resource "aws_security_group" "app_sg" {
    vpc_id = aws_vpc.myvpc.id
    name = "app-sg"
    ingress{
        description = "allow ssh"
        from_port=22
        to_port=22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress{
        description = "allow all traffic"
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]

    }

}
resource "aws_security_group" "rds_sg" {
    vpc_id = aws_vpc.myvpc.id
    name = "rds-sg"
    ingress{
        description = "allow rds"
        from_port=3306
        to_port=3306
        protocol = "tcp"
        security_groups = [aws_security_group.app_sg.id]

    }

    egress{
        description = "allow all traffic"
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]

    }
}
