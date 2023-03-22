module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 4.0"

  name = "single-instance"

  ami                    = "ami-0f8ca728008ff5af4"
  instance_type          = "t2.micro"
  key_name               = "vkkey"
  vpc_security_group_ids = ["sg-033636df704a2c90f"]
  subnet_id              = "subnet-0863fe1077f34387d"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}