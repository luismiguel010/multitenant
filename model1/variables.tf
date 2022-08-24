#------------------------------------------------------------------------------------------------------
#                                   Resource Group
#------------------------------------------------------------------------------------------------------

variable "azurerm_resource_group_model1_multitenant_rg_name" {
  type        = string
  description = "RG name in Azure"
}

variable "azurerm_resource_group_model1_multitenant_rg_location" {
  type        = string
  description = "RG location"
}

#------------------------------------------------------------------------------------------------------
#                                   Cosmos DB (SQL) & Container
#------------------------------------------------------------------------------------------------------

variable "azurerm_cosmosdb_account_model1_multitenant_name" {
  type        = string
  description = "Cosmos DB account name"
}

variable "azurerm_cosmosdb_sql_database_model1_multitenant_name" {
  type        = string
  description = "Cosmos Database name"
}

variable "azurerm_cosmosdb_sql_container_model1_multitenant_name" {
  type        = string
  description = "Cosmos db container name"
}


variable "azurerm_cosmosdb_sql_container_model1_multitenant_partition_key_path" {
  type        = string
  description = "Cosmos db container partition key"
}

variable "azurerm_cosmosdb_sql_container_model1_multitenant_unique_key" {
  type        = list(string)
  description = "Cosmos db container unique key"
}

#------------------------------------------------------------------------------------------------------
#                                   IoT Hub
#------------------------------------------------------------------------------------------------------

variable "azurerm_iothub_model1_multitenant_name" {
  type        = string
  description = "IoT Hub name"
}

variable "azurerm_iothub_model1_multitenant_sku_name" {
  type        = string
  description = "IoT Hub Sku name"
}

variable "azurerm_iothub_model1_multitenant_sku_capacity" {
  type        = string
  description = "IoT Hub Sku capacity"
}
