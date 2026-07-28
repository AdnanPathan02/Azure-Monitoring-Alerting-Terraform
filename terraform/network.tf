resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

  tags = local.common_tags
}

resource "azurerm_virtual_network" "main" {
  name                = "VNet-${local.name_prefix}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.10.0.0/16"]

  tags = local.common_tags
}

resource "azurerm_subnet" "vm" {
  name                 = "Subnet-VM"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.10.1.0/24"]
}

resource "azurerm_network_security_group" "vm" {
  name                = "NSG-${local.name_prefix}-vm"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  security_rule {
    name                       = "Allow-RDP-From-Admin"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = var.allowed_rdp_source
    destination_address_prefix = "*"
  }

  tags = local.common_tags
}

resource "azurerm_subnet_network_security_group_association" "vm" {
  subnet_id                 = azurerm_subnet.vm.id
  network_security_group_id = azurerm_network_security_group.vm.id
}

resource "azurerm_public_ip" "vm" {
  name                = "PIP-${local.name_prefix}-vm"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  allocation_method = "Static"
  sku               = "Standard"

  tags = local.common_tags
}

resource "azurerm_network_interface" "vm" {
  name                = "NIC-${local.name_prefix}-vm"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.vm.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm.id
  }

  tags = local.common_tags
}