resource "aws_instance" "bastion" {
  count = var.bastion_instance_count

  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = element(var.public_subnet_ids, count.index)
  key_name      = var.key_name

  security_groups = [var.security_group_ids["bastion"]]

  tags = {
    Name = "${var.name}-bastion-${count.index}"
  }
}

resource "aws_instance" "private" {
  count = var.private_instance_count

  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = element(var.private_subnet_ids, count.index)
  key_name      = var.key_name

  security_groups = [var.security_group_ids["private"]]

  user_data = var.user_data
  tags = {
    Name = "${var.name}-private-${count.index}"
  }
}
