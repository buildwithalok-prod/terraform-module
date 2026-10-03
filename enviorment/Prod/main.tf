

module "resource_group" {
  source = "../../module/azurerm_resource"
  rgs    = var.rgs
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_virtual_network"
  vnet       = var.vnet
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../module/azurerm_subnet"
  subnet     = var.subnet
}

module "public_ip_address" {
  depends_on        = [module.subnet]
  source            = "../../module/azurerm_public_ip"
  public_ip_address = var.public_ip_address

}


module "virtual_machine" {
  depends_on = [module.subnet, module.public_ip_address]
  source     = "../../module/azurerm_Virtual_machine"
  vm         = var.vm
}
