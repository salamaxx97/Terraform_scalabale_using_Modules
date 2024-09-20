module "vpc" {
    source = "./vpc"
    vpc_cidr = var.vpc_cidr
    
}