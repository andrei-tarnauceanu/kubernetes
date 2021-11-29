data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "file_share" {
  name                = "${var.aks_name_prefix}${terraform.workspace}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "create",
      "get",
    ]

    secret_permissions = [
      "set",
      "get",
      "delete",
      "purge",
      "recover"
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

resource "azurerm_key_vault_secret" "file_share" {
  name         = azurerm_storage_account.aks_storage_account.name
  value        = azurerm_storage_account.aks_storage_account.primary_access_key
  key_vault_id = azurerm_key_vault.file_share.id
}
