variable "security_group_id" {
  description = "Security group for the load balancer."
  type        = string
}

variable "name" {
  description = "Name of the load balancer."
  type        = string
}


variable "load_balancer_type" {
  description = "type of the load balancer."
  type        = string
}

variable "internal" {
  description = "is load balancer internal ? "
  type        = bool
}

variable "subnet_ids" {
  description = "List of subnet IDs for the load balancer."
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID for the load balancer."
  type        = string
}

variable "instance_ids" {
  description = "List of instance IDs to attach to the load balancer."
  type        = list(string)
}
