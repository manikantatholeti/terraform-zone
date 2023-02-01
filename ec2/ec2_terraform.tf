provider "aws" {
  profile    = "default"
  region     = "ap-south-1"
}

resource "aws_instance" "sample" {
  ami           = "ami-06984ea821ac0a879"
  instance_type = "t2.micro"
  key_name  = "manikey"
  # vpc_security_group_ids = "sg-033636df704a2c90f"
  security_groups = ["launch-wizard-1","default"]
    tags = {
    "Name" = "mani"
  }
}