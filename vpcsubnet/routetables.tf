/* Routing table for public subnet */
# resource "aws_route_table" "test-public-rtb" {
#   vpc_id = "${aws_vpc.test-vpc.id}"
#   tags = {
#     Name        = "${var.environment}-public-rtb"
#     Environment = "${var.environment}"
#   }
# }

/* Routing table for private subnet */
# resource "aws_route_table" "test-private-rtb" {
#   vpc_id = "${aws_vpc.test-vpc.id}"
#   tags = {
#     Name        = "${var.environment}-private-rtb"
#     Environment = "${var.environment}"
#   }
# }