output "subnet_ids_by_name" {
  description = "Map of subnet Name to subnet IDs."
  value = { for subnet_key, subnet in aws_subnet.subnets : subnet_key=> subnet.id }
}
