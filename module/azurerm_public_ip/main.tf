

resource "azurerm_public_ip" "public_ip_address" {
  for_each = var.public_ip_address
  name                = each.value.name
  sku                 = each.value.sku
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
}