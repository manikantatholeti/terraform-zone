
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region     = "ap-south-1"
}
resource "aws_vpc" "test-vpc" {
  cidr_block= "10.0.0.0/16"


  tags = {
    Name = "test-vpc"       
  }
}

resource "aws_subnet" "test-public-subnet" {

  vpc_id = aws_vpc.test-vpc.id #explisit dependency
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "test-public-subnet"
  }
}
resource "aws_subnet" "test-private-subnet" {

  vpc_id = aws_vpc.test-vpc.id #explisit dependency
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "test-private-subnet"
  }
}
resource "aws_subnet" "test-db-subnet" {

  vpc_id = aws_vpc.test-vpc.id #explisit dependency
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "test-db-subnet"
  }
}
resource "aws_internet_gateway" "test-igw" {
  vpc_id = aws_vpc.test-vpc.id

  tags = {
    Name = "test-igw"
  }
}

/* Elastic IP for NAT */
resource "aws_eip" "test-nat-eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.test-igw]
    tags = {
    Name = "test-nat-eip"
  }
}

## Test NAT gateway creation ##
resource "aws_nat_gateway" "test-NGW" {
  allocation_id = "${aws_eip.test-nat-eip.id}"
  subnet_id     = "${element(aws_subnet.test-public-subnet.*.id, 0)}"
  tags = {
    Name        = "${var.testngwname}"
    # Environment = "${var.environment}"
  }
}

# resource "aws_route_table" "test-public-rtb" {
#   vpc_id = aws_vpc.test-vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.test-igw.id
#   }
#   tags = {
#     Name = "test-public-rtb"
#   }
# }
# resource "aws_route_table" "test-private-rtb" {
#   vpc_id = aws_vpc.test-vpc.id

#   # route {
#   #   cidr_block = "0.0.0.0/0"
#   #   gateway_id = aws_nat_gateway.test-ngw.id
#   # }
#   tags = {
#     Name = "test-private-rtb"
#   }
# }