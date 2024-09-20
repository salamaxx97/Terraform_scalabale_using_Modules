variable "vpc_id" {
  type = string
}

variable "internet_gateway_id" {
  type = string
}

variable "nat_gateway_id" {
  type = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs to associate with the public route table."
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs to associate with the private route table."
  type        = list(string)
}
