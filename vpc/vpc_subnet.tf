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
resource "aws_vpc" "my_vpc" {
  cidr_block= "10.10.0.0/16"
 

  tags = {
    Name = "my_vpc"       
  }
}

resource "aws_subnet" "first_subnet" {
  
  vpc_id = aws_vpc.my_vpc.id #explisit dependency
  cidr_block = "10.10.0.0/24"
  tags = {
    name = "first subnet"
  }
  depends_on = [
    aws_vpc.my_vpc
  ]
}
resource "aws_subnet" "second_subnet" {
  
  vpc_id = aws_vpc.my_vpc.id #explisit dependency
  cidr_block = "10.10.1.0/24"
  tags = {
    name = "second subnet"
  }
  depends_on = [
    aws_subnet.first_subnet
  ]
}
resource "aws_subnet" "third_subnet" {
  
  vpc_id = aws_vpc.my_vpc.id #explisit dependency
  cidr_block = "10.10.2.0/24"
  tags = {
    name = "third subnet"
  }
  depends_on = [
    aws_subnet.second_subnet
  ]
}
resource "aws_subnet" "fourth_subnet" {
  
  vpc_id = aws_vpc.my_vpc.id #explisit dependency
  cidr_block = "10.10.3.0/24"
  tags = {
    name = "fourth subnet"
  }
  depends_on = [
    aws_subnet.third_subnet
      ]
}
resource "aws_subnet" "fifth_subnet" {
  
  vpc_id = aws_vpc.my_vpc.id #explisit dependency
  cidr_block = "10.10.4.0/24"
  tags = {
    name = "fifth subnet"
  }
  depends_on = [
    aws_subnet.fourth_subnet
  ]
}
    resource "aws_subnet" "sixth_subnet"{
  vpc_id = aws_vpc.my_vpc.id #explisit dependency
  cidr_block = "10.10.5.0/24"
  tags = {
    name = "sixth subnet"
  }
  depends_on = [
    aws_subnet.fifth_subnet
    ]
      
    }