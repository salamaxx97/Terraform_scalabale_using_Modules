output "subnet_ids_by_name" {
  description = "Map of subnet Name to subnet IDs."
  value = { for subnet_key, subnet in aws_subnet.subnets : subnet_key=> subnet.id }
}

output "public_subnets" {
  description = "List of IDs of public subnets."
  value = [for subnet_key, subnet in aws_subnet.subnets : subnet.id if subnet.map_public_ip_on_launch == true]
}

output "private_subnets" {
  description = "List of IDs of private subnets."
  value = [for subnet_key, subnet in aws_subnet.subnets : subnet.id if subnet.map_public_ip_on_launch == false]
}
