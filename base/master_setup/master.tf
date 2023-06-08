
variable "masterMain" {}
variable "pr_vars" {}
variable "np_vars" {}


provider "aws" {
  region = "${var.masterMain.region}"
    profile = "${var.masterMain.profile}"
}


# module "master_setup_route53" {
#    source = "./route53"
#    master = var.masterMain
# }

module "master_setup_pr" {
    source = "../../modules/infrastructure/"
    masterMain = var.masterMain
    infaMain = var.pr_vars   
}


module "master_setup_np" {
    source = "../../modules/infrastructure/"
    masterMain = var.masterMain
    infaMain = var.np_vars 
}

