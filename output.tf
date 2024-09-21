output "load_balancer_dns" {
  description = "DNS name of the load balancer"
  value       = module.load_balancer.load_balancer_dns
}

output "bastion_instance_public_ip" {
  value = module.ec2_instances.bastion_instance_public_ip
} 

output "private_instance_ips" {
  value = module.ec2_instances.private_instance_ips
}

output "key_path" {
  value = "~/.ssh/${module.ssh_key.key_name}.pem"
}
