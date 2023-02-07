resource "aws_route" "public_internet_gateway" {
  route_table_id         = "${aws_route_table.test-public-rtb.id}"
  destination_cidr_block = "${var.publiccidrblock}"
  gateway_id             = "${aws_internet_gateway.test-igw.id}"
}
resource "aws_route" "private_nat_gateway" {
  route_table_id         = "${aws_route_table.test-private-rtb.id}"
  destination_cidr_block = "${var.publiccidrblock}"
  nat_gateway_id         = "${aws_nat_gateway.test-NGW.id}"
}
/* Route table associations */
resource "aws_route_table_association" "public" {
  count          = "${length(aws_subnet.test-public-subnet.cidr_block)}"
  subnet_id      = "${element(aws_subnet.test-public-subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.test-public-rtb.id}"
}
/* Route table associations */
resource "aws_route_table_association" "private" {
  count          = "${length(aws_subnet.test-private-subnet.cidr_block)}"
  subnet_id      = "${element(aws_subnet.test-private-subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.test-private-rtb.id}"
}