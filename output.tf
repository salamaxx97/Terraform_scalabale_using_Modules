output "load_balancer_dns" {
  description = "DNS name of the load balancer"
  value       = module.load_balancer.load_balancer_dns
}