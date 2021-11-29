resource "azurerm_resource_group" "main" {
  name     = "${var.main_resource_group_prefix}-${terraform.workspace}"
  location = var.main_resource_group_location
}