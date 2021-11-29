# resource "azurerm_virtual_network" "main" {
#   name                = var.main_vnet_name
#   resource_group_name = azurerm_resource_group.main.name
#   location            = azurerm_resource_group.main.location
#   address_space       = ["${var.main_vnet_space}"]

# }

# resource "azurerm_subnet" "main-aks" {
#   count                = length(var.aks_subnets)
#   name                 = "aks_${count.index}"
#   resource_group_name  = azurerm_resource_group.main.name
#   virtual_network_name = azurerm_virtual_network.main.name
#   address_prefix       = var.aks_subnets[count.index]
# }
