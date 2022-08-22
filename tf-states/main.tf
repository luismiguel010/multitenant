resource "azurerm_resource_group" "tfstate-multitenant-rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "random_integer" "priority" {
  min = var.random_integer_min_value
  max = var.random_integer_max_value

}

resource "azurerm_storage_account" "tfstate" {
  name                     = lower("${var.azurerm_storage_account_name}${random_integer.priority.result}")
  resource_group_name      = azurerm_resource_group.tfstate-multitenant-rg.name
  location                 = azurerm_resource_group.tfstate-multitenant-rg.location
  account_tier             = var.azurerm_storage_account_account_tier
  account_replication_type = var.azurerm_storage_account_replication_type

  tags = {
    experiment = var.azurerm_storage_account_tag_value
  }

  depends_on = [
    random_integer.priority
  ]
}

resource "azurerm_storage_container" "tfstate-model1" {
  name                  = var.azurerm_storage_container_name
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = var.azurerm_storage_container_access_type
}
