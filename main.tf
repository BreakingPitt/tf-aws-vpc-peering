resource "aws_vpc_peering_connection" "vpc_peering" {
  auto_accept = "${var.auto_accept_peering ? true : false}"
  lifecycle {
    create_before_destroy = "true"
  }
  peer_owner_id = "${var.aws_owner_account_id}"
  peer_vpc_id = "${var.remote_aws_vpc_id}"
  vpc_id      = "${var.local_aws_vpc_id}"
  tags {
    Deployed    = "Terraform"
    Name        = "VPC Peering between ${var.local_aws_vpc_id} and ${var.remote_aws_vpc_id}"
  }
}

# Private local peering route table.
resource "aws_route" "local_public_remote_route" {
  count                     = "${length(var.local_public_route_table_ids)}"
  depends_on                = [ "aws_vpc_peering_connection.vpc_peering" ]
  destination_cidr_block    = "${var.remote_aws_vpc_cidr}"
  route_table_id            = "${element(var.local_public_route_table_ids,count.index)}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.vpc_peering.id}"
}

# Private local peering route table.
resource "aws_route" "local_private_remote_route" {
  count                     = "${length(var.local_private_route_table_ids)}"
  depends_on                = [ "aws_vpc_peering_connection.vpc_peering" ]
  destination_cidr_block    = "${var.remote_aws_vpc_cidr}"
  route_table_id            = "${element(var.local_private_route_table_ids,count.index)}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.vpc_peering.id}"
}

# Private remote peering route table.
resource "aws_route" "remote_private_local_route" {
  count                     = "${length(var.remote_private_route_table_ids)}"
  depends_on                = [ "aws_vpc_peering_connection.vpc_peering" ]
  destination_cidr_block    = "${var.local_aws_vpc_cidr}"
  route_table_id            = "${element(var.remote_private_route_table_ids,count.index)}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.vpc_peering.id}"
}
