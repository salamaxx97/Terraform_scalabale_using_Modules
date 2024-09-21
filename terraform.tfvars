vpc_cidr = "10.0.0.0/16"
ami      = "ami-0a0e5d9c7acc336f1"

subnets = {
  "public-subnet-1" = {
    cidr_block              = "10.0.1.0/24"
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = true
  },
  "private-subnet-1" = {
    cidr_block              = "10.0.2.0/24"
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = false
  }
  "public-subnet-2" = {
    cidr_block              = "10.0.3.0/24"
    availability_zone       = "us-east-1b"
    map_public_ip_on_launch = true
  },
  "private-subnet-2" = {
    cidr_block              = "10.0.4.0/24"
    availability_zone       = "us-east-1b"
    map_public_ip_on_launch = false
  }
}

user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
              systemctl start nginx
              systemctl enable nginx
              echo "<html><body><h1>Hello, to the private host $(hostname -i)  !</h1></body></html>" > index.html
              cp index.html /var/www/html/
              EOF

keypair = "myapp-kypair"