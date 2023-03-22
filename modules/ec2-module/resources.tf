resource "aws_instance""test-instance" {
  ami           = "ami-0f8ca728008ff5af4"
  instance_type = var.instancetype
#   instance_type = "t2.micro"
  key_name  = "vkkey"
  subnet_id = "subnet-0863fe1077f34387d"
  associate_public_ip_address = true
  # vpc_security_group_ids = "sg-033636df704a2c90f"
  security_groups = ["sg-033636df704a2c90f"]
    tags = {
    "Name" = "test-instance"
  }
}