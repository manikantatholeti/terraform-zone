resource "aws_instance""test-instance" {
  ami           = var.ami
  instance_type = var.instancetype
#   instance_type = "t2.micro"
  key_name  = var.key_name
  subnet_id = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  # vpc_security_group_ids = "sg-033636df704a2c90f"
  security_groups = ["sg-033636df704a2c90f"]
    tags = {
    "Name" = var.Name
  }
}