resource "aws_instance""test-instance" {
  ami           = "ami-06984ea821ac0a879"
  instance_type = "t2.micro"
  key_name  = "vkkey"
  subnet_id = "subnet-070409580ce784729"
  # vpc_security_group_ids = "sg-033636df704a2c90f"
  security_groups = ["sg-0ad142f3da4b93808"]
    tags = {
    "Name" = "test-instance"
  }
}