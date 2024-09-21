module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr

}
module "subnets" {
  source = "./modules/Subnets"

  vpc_id  = module.vpc.vpc_id
  subnets = var.subnets
}

module "igw" {
  source = "./modules/InternetGateway"
  vpc_id = module.vpc.vpc_id
}

module "nat_gateway" {
  source           = "./modules/NatGateway"
  public_subnet_id = module.subnets.public_subnets[0]
  Name = "MyNatGatewaY"
}


module "routing" {
  source              = "./modules/Routing"
  vpc_id              = module.vpc.vpc_id
  internet_gateway_id = module.igw.id
  nat_gateway_id      = module.nat_gateway.id

  public_subnet_ids  = module.subnets.public_subnets
  private_subnet_ids = module.subnets.private_subnets
}
