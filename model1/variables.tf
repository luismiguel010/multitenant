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

variable "azurerm_cosmosdb_account_model1_multitenant_offer_type" {
  type        = string
  description = "Cosmos DB account offer type"
}

variable "azurerm_cosmosdb_account_model1_multitenant_consistency_policy" {
  type        = map(any)
  description = "Cosmos DB account consistency policy"
}

variable "azurerm_cosmosdb_account_model1_multitenant_geo_location" {
  type        = map(any)
  description = "Cosmos DB account geo location"
}

variable "azurerm_cosmosdb_sql_database_model1_multitenant_name" {
  type        = string
  description = "Cosmos Database name"
}

variable "azurerm_cosmosdb_sql_container_model1_multitenant_tenants_name" {
  type        = string
  description = "Cosmos db container name"
}


variable "azurerm_cosmosdb_sql_container_model1_multitenant_tenants_partition_key_path" {
  type        = string
  description = "Cosmos db container partition key"
}

variable "azurerm_cosmosdb_sql_container_model1_multitenant_tenants_unique_key" {
  type        = list(string)
  description = "Cosmos db container unique key"
}

variable "azurerm_cosmosdb_sql_container_model1_multitenant_devices_name" {
  type        = string
  description = "Cosmos db container name"
}


variable "azurerm_cosmosdb_sql_container_model1_multitenant_devices_partition_key_path" {
  type        = string
  description = "Cosmos db container partition key"
}

variable "azurerm_cosmosdb_sql_container_model1_multitenant_devices_unique_key" {
  type        = list(string)
  description = "Cosmos db container unique key"
}

#------------------------------------------------------------------------------------------------------
#                                   IoT Hub
#------------------------------------------------------------------------------------------------------
variable "azurerm_stream_analytics_job_model1_multitenant_name" {
  type        = string
  description = "Stram analytics job name"
}

variable "azurerm_stream_analytics_job_model1_multitenant_streaming_units" {
  type        = number
  description = "Stream analyctic job streaming units"
}

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

variable "azurerm_stream_analytics_stream_input_iothub_model1_multitenant_name" {
  type        = string
  description = "Stram analytics input iot hub name"
}

variable "azurerm_stream_analytics_stream_input_iothub_model1_multitenant_endpoint" {
  type        = string
  description = "Stram analytics input iot hub endpoint"
}

variable "azurerm_stream_analytics_stream_input_iothub_model1_multitenant_endpoint_consumer_group_name" {
  type        = string
  description = "Stram analytics input iot hub endpoint consumer group name"
}

variable "azurerm_stream_analytics_stream_input_iothub_model1_multitenant_shared_access_policy_name" {
  type        = string
  description = "Stram analytics input iot hub shared access policy name"
}

variable "azurerm_stream_analytics_stream_input_iothub_model1_multitenant_serialization_type" {
  type        = string
  description = "Stram analytics input iot hub serialization type"
}

variable "azurerm_stream_analytics_stream_input_iothub_model1_multitenant_serialization_encoding" {
  type        = string
  description = "Stram analytics input iot hub serialization encoding"
}

variable "azurerm_stream_analytics_output_cosmosdb_model1_multitenant_name" {
  type        = string
  description = "Stream analytics output cosmosdb name"
}



