module "security_group" {
  source = "./modules/SecurityGroup"
  name   = "my-app"
  vpc_id = module.vpc.vpc_id
}

module "ssh_key" {
  source   = "./modules/KeyPair"
  key_name = "myapp-keypair"
}


module "ec2_instances" {
  depends_on = [module.nat_gateway]
  source                 = "./modules/EC2Instances"
  name                   = "Nginx"
  ami                    = var.ami
  instance_type          = var.instance_type
  user_data = var.user_data
  bastion_instance_count = 1
  private_instance_count = 2
  public_subnet_ids      = module.subnets.public_subnets
  private_subnet_ids     = module.subnets.private_subnets
  key_name               = module.ssh_key.key_name
  security_group_ids = {
    bastion = module.security_group.bastion_sg_id
    private = module.security_group.private_instance_sg_id
  }
}

module "load_balancer" {
  source             = "./modules/LoadBalancer"
  name               = "my-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_group_id  = module.security_group.load_balancer_sg_id
  subnet_ids         = module.subnets.public_subnets
  vpc_id             = module.vpc.vpc_id
  instance_ids       = module.ec2_instances.private_instance_ids
}


