rgs = {
  "rg1" = {
    name     = "rg-terraform-vm"
    location = "centralindia"
  }
  "rg2" = {
    name     = "rg-terraform-vm-2"
    location = "centralindia"
  }
  "rg3" = {
    name     = "rg-terraform-vm-3"
    location = "centralindia"
  }
}

vnet = {
  "vnet1" = {
    name                = "vnet1"
    resource_group_name = "rg-terraform-vm"
    location            = "centralindia"
    address_space       = ["192.168.0.0/16"]
  }
}

subnet = {
  subnet1 = {
    name                 = "subnet1"
    resource_group_name  = "rg-terraform-vm"
    virtual_network_name = "vnet1"
    # Edited: Use valid network-boundary CIDR blocks.
    address_prefixes = ["192.168.0.0/28"]
  }
  subnet2 = {
    name                 = "subnet2"
    resource_group_name  = "rg-terraform-vm"
    virtual_network_name = "vnet1"
    # Edited: Use valid network-boundary CIDR blocks.
    address_prefixes = ["192.168.1.0/28"]
  }
}

public_ip_address = {
  public_ip_address_1 = {
    name                = "public_ip_address_1"
    sku                 = "Standard"
    location            = "centralindia"
    resource_group_name = "rg-terraform-vm"
    allocation_method   = "Static"
  }
}

vm = {
  vm1 = {
    vm_name             = "vm1"
    resource_group_name = "rg-terraform-vm"
    location            = "centralindia"
    vm_size             = "Standard_D2s_v5"
    admin_username      = "adminuser"
    admin_password      = "Admin@123"
    nic_card = {
      name                 = "nic1"
      subnet_name          = "subnet1"
      virtual_network_name = "vnet1"
      public_ip_name       = "public_ip_address_1"
    }
  }
}
