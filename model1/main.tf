#------------------------------------------------------------------------------------------------------
#                                   Resource Group
#------------------------------------------------------------------------------------------------------
resource "azurerm_resource_group" "model1_multitenant_rg" {
  name     = var.azurerm_resource_group_model1_multitenant_rg_name
  location = var.azurerm_resource_group_model1_multitenant_rg_location
}
#------------------------------------------------------------------------------------------------------
#                                   Cosmos DB (SQL) & Container
#------------------------------------------------------------------------------------------------------
data "azurerm_cosmosdb_account" "model1_multitenant" {
  name                = var.azurerm_cosmosdb_account_model1_multitenant_name
  resource_group_name = azurerm_resource_group.model1_multitenant_rg.name
}

resource "azurerm_cosmosdb_sql_database" "model1_multitenant" {
  name                = var.azurerm_cosmosdb_sql_database_model1_multitenant_name
  resource_group_name = data.azurerm_cosmosdb_account.model1_multitenant.resource_group_name
  account_name        = data.azurerm_cosmosdb_account.model1_multitenant.name
}

resource "azurerm_cosmosdb_sql_container" "model1_multitenant" {
  name                = var.azurerm_cosmosdb_sql_container_model1_multitenant_name
  resource_group_name = data.azurerm_cosmosdb_account.model1_multitenant.resource_group_name
  account_name        = data.azurerm_cosmosdb_account.model1_multitenant.name
  database_name       = azurerm_cosmosdb_sql_database.model1_multitenant.name
  partition_key_path  = var.azurerm_cosmosdb_sql_container_model1_multitenant_partition_key_path

  unique_key {
    paths = var.azurerm_cosmosdb_sql_container_model1_multitenant_unique_key
  }
}
#------------------------------------------------------------------------------------------------------
#                                   IoT Hub
#------------------------------------------------------------------------------------------------------
resource "azurerm_iothub" "model1_multitenant" {
  name                = var.azurerm_iothub_model1_multitenant_name
  resource_group_name = azurerm_resource_group.model1_multitenant_rg.name
  location            = azurerm_resource_group.model1_multitenant_rg.location
  sku {
    name     = var.azurerm_iothub_model1_multitenant_sku_name
    capacity = var.azurerm_iothub_model1_multitenant_sku_capacity
  }
}
