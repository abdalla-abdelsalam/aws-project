module "mynetwork" {
  source   = "./network"
  cidr     = var.vpc_cidr
  sub_pub  = var.sub_public
  azs      = var.availability_zones
  sub_priv = var.sub_private
}