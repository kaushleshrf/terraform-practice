module "rg_aish" {
  source  = "../../module/resource group"
  rg_aish = var.rg_aish

}

module "kv_aish" {
  depends_on = [module.rg_aish]
  source     = "../../module/keyvault"
  kv-aish    = var.kv-aish

}
module "vent_aish" {
  depends_on = [module.rg_aish]
  source     = "../../module/virtual network"
  vent_aish  = var.vent_aish
}

module "subnet_aish" {
  depends_on  = [module.vent_aish]
  source      = "../../module/subnet"
  subnet_aish = var.subnet_aish
}

module "bstn_aish" {
  depends_on = [module.subnet_aish]
  source     = "../../module/bastion"
  bstn_aish  = var.bstn_aish
}

module "nic_aish" {
  depends_on = [module.subnet_aish]
  source     = "../../module/nic"
  nic_aish   = var.nic_aish
}


module "vm_aish" {
  depends_on = [module.nic_aish]
  source     = "../../module/virtual machine"
  vm_aish    = var.vm_aish

}
