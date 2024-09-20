output "load_balancer_arn" {
  value = aws_lb.lb.arn
}

output "target_group_arn" {
  value = aws_lb_target_group.tg.arn
}

output "load_balancer_dns" {
  description = "DNS name of the load balancer"
  value       = aws_lb.lb.dns_name
}