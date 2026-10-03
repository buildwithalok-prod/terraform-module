
resource "azurerm_resource_group" "rg" {
  for_each= var.rgs
  location = each.value.location
  name     = each.value.name
}