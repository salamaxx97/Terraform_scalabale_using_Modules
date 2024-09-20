variable "vpc_id" {
  type        = string
}

variable "subnets" {
  description = "Map of subnet configurations where each key is a subnet name and value is its attributes."
  type = map(object({
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = bool
  }))
}
