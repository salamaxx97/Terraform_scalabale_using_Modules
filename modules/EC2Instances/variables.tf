variable "name" {
  description = "name for the instances."
  type        = string
}

variable "ami" {
  description = "AMI ID for the instances."
  type        = string
}

variable "instance_type" {
  description = "Instance type."
  type        = string
}

variable "bastion_instance_count" {
  description = "Number of bastion instances."
  type        = number
  default     = 1
}

variable "private_instance_count" {
  description = "Number of private instances."
  type        = number
  default     = 2
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for bastion instances."
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for private instances."
  type        = list(string)
}

variable "key_name" {
  description = "SSH key name for accessing the instances."
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs."
  type        = map(string)
}

variable "user_data" {
  description = "script to install application"
  type        = string
  default     = ""
}