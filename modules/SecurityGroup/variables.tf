variable "name" {
  description = "Base name for the security groups."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the security groups will be created."
  type        = string
}
