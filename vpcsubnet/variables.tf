## environment name ##
variable "environment" {
  description = "Environment name"
  default = "test"
}

## NAT gateway name ##
variable "testngwname" {
  description = "NAT gateway name"
  default = "test-NGW"
}

## routetable variables ###

variable "publiccidrblock" {
  description = "Public RTB CIDR range"
  default = "0.0.0.0/0"
}