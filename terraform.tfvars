vpc_cidr = "10.0.0.0/16"

subnets = {
    "public-subnet-1" = {
      cidr_block              = "10.0.1.0/24"
      availability_zone       = "us-east-1a"
      map_public_ip_on_launch = true
    },
    "private-subnet-1" = {
      cidr_block              = "10.0.2.0/24"
      availability_zone       = "us-east-1b"
      map_public_ip_on_launch = false
    }
  }