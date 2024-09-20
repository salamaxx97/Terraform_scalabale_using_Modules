variable "aws_region" {
  default = "us-east-1"
}

variable "aws_profile" {
  default = "default"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "subnets" {
  type = map(object({
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = bool
  }))
  description = "Map of subnets with CIDR blocks, availability zones, and public IP assignment settings"
}


# variable "security_groups" {
#   type = map(any)
# }

# variable "availability_zones" {
#   type = list(any)
# }

# variable "instances" {
#   type = map(any)
# }

# variable "ami" {
#   type = string
# }
# variable "instance_type" {
#   type = string
# }