variable "local_aws_vpc_id"  {
  default     = ""
  description = "Local vpc id to be part of the vpc peering."
}

variable "remote_aws_vpc_id" {
  default     = ""
  description = "Remote vpc id to be part of the vpc peering."
}

variable "auto_accept_peering" {
  default     = ""
  description = "Auto accept peering connection."
}

variable "aws_owner_account_id" {
  default     = ""
  description = "AWS owner account ID."
}

variable "local_aws_vpc_cidr" {
  default     = ""
  description = "Local vpc CIDR block."
}

variable "remote_aws_vpc_cidr" {
  default     = ""
  description = "Remote vpc CIDR block."
}

variable "local_public_route_table_ids" {
  default     = []
  description = "AWS owner account ID."
  type        = "list"
}

variable "local_private_route_table_ids" {
  default     = []
  description = "A list of private route tables."
  type        = "list"
}

variable "remote_private_route_table_ids" {
  default     = []
  description = "A list of private route tables."
  type        = "list"
}

variable "vpc_peer_source_cidr_block" {
  default     = ""
  description = "Vpc source CIDR block."
}

variable "vpc_peer_dest_cidr_block" {
  default     = ""
  description = "Vpc dest CIDR block."
}
