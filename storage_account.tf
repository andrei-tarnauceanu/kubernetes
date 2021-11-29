resource "azurerm_storage_account" "aks_storage_account" {
  name                     = "${var.aks_name_prefix}${terraform.workspace}"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    environment = "${terraform.workspace}"
  }
}

resource "azurerm_storage_share" "file_share" {
  name                 = "${var.aks_name_prefix}${terraform.workspace}"
  storage_account_name = azurerm_storage_account.aks_storage_account.name
  quota                = 50
}