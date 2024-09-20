module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr
    
}
module "subnets" {
  source  = "./modules/Subnets"

  vpc_id  = module.vpc.vpc_id
  subnets = var.subnets
}
