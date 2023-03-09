resource "aws_instance""test-instance" {
  ami           = "ami-06984ea821ac0a879"
  instance_type = "t2.micro"
  key_name  = "vkkey"
  subnet_id = "subnet-008a698bd858d6485"
  associate_public_ip_address = true
  # vpc_security_group_ids = "sg-033636df704a2c90f"
  security_groups = ["sg-0749de24b4ce6a2b7"]
    tags = {
    "Name" = "test-instance"
  }
}