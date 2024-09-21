output "bastion_instance_ids" {
  value = aws_instance.bastion[*].id
}

output "private_instance_ids" {
  value = aws_instance.private[*].id
}

output "bastion_instance_public_ip" {
  value = aws_instance.bastion[*].public_ip
} 

output "private_instance_ips" {
  value = aws_instance.private[*].private_ip
}