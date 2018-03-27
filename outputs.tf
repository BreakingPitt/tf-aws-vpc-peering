output "vpc_peering_id" {
  description = "Id of the created VPC peering connection"
  value       = "${aws_vpc_peering_connection.vpc_peering.id}"
}

output "local_public_route_tables" {
  description = "Local Public route tables"
  value       = [ "${aws_route.local_public_remote_route.*.id}" ]
}
output "local_private_route_tables" {
  description = "Local private route tables"
  value       = [ "${aws_route.local_private_remote_route.*.id}" ]
}

output "remote_private_local_route" {
  description = "Remote private route tables"
  value       = [ "${aws_route.remote_private_local_route.*.id}" ]
}
