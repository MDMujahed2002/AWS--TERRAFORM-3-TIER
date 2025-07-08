resource "aws_vpc" "myvpc"{
    cidr_block = "172.0.0.0/16"
    tags={
        Name="VPC-TF"
    }
}
resource "aws_subnet" "public_1"{
    vpc_id= aws_vpc.myvpc.id
    cidr_block= "172.0.10.0/24"
    availability_zone = "us-east-1a"
    tags={
        Name="public-subnet1"
    }
}
resource "aws_subnet" "public_2"{
    vpc_id= aws_vpc.myvpc.id
    cidr_block= "172.0.20.0/24"
    availability_zone = "us-east-1b"
    tags={
        Name="public-subnet2"
    }
}
resource "aws_subnet" "private_1"{
    vpc_id= aws_vpc.myvpc.id
    cidr_block= "172.0.30.0/24"
    availability_zone = "us-east-1c"
    tags={
        Name="private-subnet1"
    }
}
resource "aws_subnet" "private_2"{
    vpc_id= aws_vpc.myvpc.id
    cidr_block= "172.0.40.0/24"
    availability_zone = "us-east-1d"
    tags={
        Name="private-subnet2"
    }
}
resource "aws_subnet" "rds_private_1"{
    vpc_id= aws_vpc.myvpc.id
    cidr_block= "172.0.50.0/24"
    availability_zone = "us-east-1a"
    tags={
        Name="rds-private-subnet1"
    }
}
resource "aws_subnet" "rds_private_2"{
    vpc_id= aws_vpc.myvpc.id
    cidr_block= "172.0.60.0/24"
    availability_zone = "us-east-1b"
    tags={
        Name="rds-private-subnet2"
    }
}
resource "aws_internet_gateway" "aws_igw"{
    vpc_id=aws_vpc.myvpc.id
    tags={
        Name="myigw"
    }
}
resource "aws_eip" "eip"{
     domain = "vpc"
    tags={
        Name= "VPC-EP"
    }
}
resource "aws_nat_gateway" "nat"{
    subnet_id = aws_subnet.public_1.id
    allocation_id = aws_eip.eip.id
    tags = {
        Name = "vpc-nat"
    }
    depends_on =[ aws_internet_gateway.aws_igw]
}
resource "aws_route_table" "public_rt"{
    vpc_id=aws_vpc.myvpc.id
    route{
        cidr_block = "0.0.0.0/0"
        gateway_id =  aws_internet_gateway.aws_igw.id
    }
    tags={
        Name="public-route-table"
    }
}
resource "aws_route_table" "private_rt"{
    vpc_id=aws_vpc.myvpc.id
    route {
        cidr_block="0.0.0.0/0"
        nat_gateway_id= aws_nat_gateway.nat.id
    }
    tags={
        Name="private-route-table"

    }
}
resource "aws_route_table_association" "pb_1"{
    subnet_id = aws_subnet.public_1.id
    route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "pb_2"{
    subnet_id = aws_subnet.public_2.id
    route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "pr_1"{
    subnet_id = aws_subnet.private_1.id
    route_table_id = aws_route_table.private_rt.id
}
resource "aws_route_table_association" "pr_2"{
    subnet_id = aws_subnet.private_2.id
    route_table_id = aws_route_table.private_rt.id
}
resource "aws_route_table_association" "rds_pr_1"{
    subnet_id = aws_subnet.rds_private_1.id
    route_table_id = aws_route_table.private_rt.id
}
resource "aws_route_table_association" "rds_pr_2"{
    subnet_id = aws_subnet.rds_private_2.id
    route_table_id = aws_route_table.private_rt.id
}

