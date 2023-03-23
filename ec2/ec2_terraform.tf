# provider "aws" {
#   profile    = "default"
#   region     = "ap-south-1"
# }

# resource "aws_instance" "sample" {
#   ami           = "ami-0f8ca728008ff5af4"
#   instance_type = "t2.micro"
#   key_name  = "veeru"
#   # vpc_security_group_ids = "sg-033636df704a2c90f"
#   security_groups = ["launch-wizard-1","default"]
#     tags = {
#     "Name" = "jenkinstf"
#   }
# }

module "ec2_instance" {
  source  = "../modules/ec2-module"
  instancetype = "t2.micro"
  ami = "ami-0f8ca728008ff5af4"
  key_name = "vkkey"
  subnet_id = "subnet-0863fe1077f34387d"
  associate_public_ip_address = true
  # security_groups = "sg-033636df704a2c90f"
  Name = "test-instance"
  # version = "~> 4.0"
}