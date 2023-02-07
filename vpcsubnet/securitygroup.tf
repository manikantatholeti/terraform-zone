/*==== VPC's Default Security Group ======*/
resource "aws_security_group" "test-sg" {
  name        = "${var.environment}-sg"
  description = "Default security group to allow inbound/outbound from the VPC"
  vpc_id      = "${aws_vpc.test-vpc.id}"
  depends_on  = [aws_vpc.test-vpc]
  ingress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
  }
  tags = {
    Name = "test-sg"
  }
}
 