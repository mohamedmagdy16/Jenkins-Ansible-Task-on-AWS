#---------------- network module ---------------------
module "network" {
  source         = "./network"
  vpc            = var.vpc
  publicsubnet1  = var.publicsubnet1
  publicsubnet2  = var.publicsubnet2
  privatesubnet1 = var.privatesubnet1
  privatesubnet2 = var.privatesubnet2
  region         = var.region
}