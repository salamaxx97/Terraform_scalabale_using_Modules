resource "aws_security_group" "load_balancer_sg" {
  name   = "${var.name}-lb-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP from anywhere
  }

  tags = {
    Name = "${var.name}-lb-sg"
  }
}

resource "aws_security_group" "private_instance_sg" {
  name   = "${var.name}-private-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.load_balancer_sg.id] # Allow HTTP from LB
  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_sg.id] # Allow SSH from Bastions
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1" # Allow all outbound traffic
  }

  tags = {
    Name = "${var.name}-private-sg"
  }
}

resource "aws_security_group" "bastion_sg" {
  name   = "${var.name}-bastion-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from anywhere
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1" # Allow all outbound traffic
  }

  tags = {
    Name = "${var.name}-bastion-sg"
  }
}
