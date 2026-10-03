data "azurerm_subnet" "subnet" {
  for_each = var.vm
  # Edited: Resolve the subnet using the nested NIC configuration.
  name                 = each.value.nic_card.subnet_name
  virtual_network_name = each.value.nic_card.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "public_ip_address" {
  for_each = var.vm
  # Edited: Resolve the public IP using the nested NIC configuration.
  name                 = each.value.nic_card.public_ip_name
  resource_group_name = each.value.resource_group_name
}
