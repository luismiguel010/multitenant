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
resource "azurerm_cosmosdb_account" "model1_multitenant" {
  name                = var.azurerm_cosmosdb_account_model1_multitenant_name
  resource_group_name = azurerm_resource_group.model1_multitenant_rg.name
  location            = azurerm_resource_group.model1_multitenant_rg.location
  offer_type          = var.azurerm_cosmosdb_account_model1_multitenant_offer_type
  consistency_policy {
    consistency_level       = var.azurerm_cosmosdb_account_model1_multitenant_consistency_policy.consistency_level
    max_interval_in_seconds = var.azurerm_cosmosdb_account_model1_multitenant_consistency_policy.max_interval_in_seconds
    max_staleness_prefix    = var.azurerm_cosmosdb_account_model1_multitenant_consistency_policy.max_staleness_prefix
  }
  geo_location {
    location          = var.azurerm_cosmosdb_account_model1_multitenant_geo_location.location
    failover_priority = var.azurerm_cosmosdb_account_model1_multitenant_geo_location.failover_priority
  }
}

resource "azurerm_cosmosdb_sql_database" "model1_multitenant" {
  name                = var.azurerm_cosmosdb_sql_database_model1_multitenant_name
  resource_group_name = azurerm_cosmosdb_account.model1_multitenant.resource_group_name
  account_name        = azurerm_cosmosdb_account.model1_multitenant.name
}

resource "azurerm_cosmosdb_sql_container" "model1_multitenant_tenants" {
  name                = var.azurerm_cosmosdb_sql_container_model1_multitenant_tenants_name
  resource_group_name = azurerm_cosmosdb_account.model1_multitenant.resource_group_name
  account_name        = azurerm_cosmosdb_account.model1_multitenant.name
  database_name       = azurerm_cosmosdb_sql_database.model1_multitenant.name
  partition_key_path  = var.azurerm_cosmosdb_sql_container_model1_multitenant_tenants_partition_key_path
}

resource "azurerm_cosmosdb_sql_container" "model1_multitenant_devices" {
  name                = var.azurerm_cosmosdb_sql_container_model1_multitenant_devices_name
  resource_group_name = azurerm_cosmosdb_account.model1_multitenant.resource_group_name
  account_name        = azurerm_cosmosdb_account.model1_multitenant.name
  database_name       = azurerm_cosmosdb_sql_database.model1_multitenant.name
  partition_key_path  = var.azurerm_cosmosdb_sql_container_model1_multitenant_devices_partition_key_path
}
#------------------------------------------------------------------------------------------------------
#                                   IoT Hub & Stream Analytics Job
#------------------------------------------------------------------------------------------------------
resource "azurerm_stream_analytics_job" "model1_multitenant" {
  name                 = var.azurerm_stream_analytics_job_model1_multitenant_name
  resource_group_name  = azurerm_resource_group.model1_multitenant_rg.name
  location             = azurerm_resource_group.model1_multitenant_rg.location
  streaming_units      = var.azurerm_stream_analytics_job_model1_multitenant_streaming_units
  transformation_query = <<QUERY
    SELECT *
    INTO [${var.azurerm_stream_analytics_output_cosmosdb_model1_multitenant_name}]
    FROM [${var.azurerm_stream_analytics_stream_input_iothub_model1_multitenant_name}]
    WHERE temperature IS NOT NULL
QUERY
}

resource "azurerm_iothub" "model1_multitenant" {
  name                = var.azurerm_iothub_model1_multitenant_name
  resource_group_name = azurerm_resource_group.model1_multitenant_rg.name
  location            = azurerm_resource_group.model1_multitenant_rg.location
  sku {
    name     = var.azurerm_iothub_model1_multitenant_sku_name
    capacity = var.azurerm_iothub_model1_multitenant_sku_capacity
  }
}

resource "azurerm_iothub_consumer_group" "model1_multitenant" {
  name                   = var.azurerm_iothub_consumer_group_name
  iothub_name            = azurerm_iothub.model1_multitenant.name
  eventhub_endpoint_name = var.azurerm_iothub_consumer_group_eventhub_endpoint_name
  resource_group_name    = azurerm_resource_group.model1_multitenant_rg.name
}

resource "azurerm_stream_analytics_stream_input_iothub" "model1_multitenant" {
  name                         = var.azurerm_stream_analytics_stream_input_iothub_model1_multitenant_name
  stream_analytics_job_name    = azurerm_stream_analytics_job.model1_multitenant.name
  resource_group_name          = azurerm_stream_analytics_job.model1_multitenant.resource_group_name
  endpoint                     = var.azurerm_stream_analytics_stream_input_iothub_model1_multitenant_endpoint
  eventhub_consumer_group_name = azurerm_iothub_consumer_group.model1_multitenant.name
  iothub_namespace             = azurerm_iothub.model1_multitenant.name
  shared_access_policy_key     = azurerm_iothub.model1_multitenant.shared_access_policy[0].primary_key
  shared_access_policy_name    = var.azurerm_stream_analytics_stream_input_iothub_model1_multitenant_shared_access_policy_name

  serialization {
    type     = var.azurerm_stream_analytics_stream_input_iothub_model1_multitenant_serialization_type
    encoding = var.azurerm_stream_analytics_stream_input_iothub_model1_multitenant_serialization_encoding
  }

}

data "azurerm_cosmosdb_account" "model1_multitenant" {
  name                = azurerm_cosmosdb_account.model1_multitenant.name
  resource_group_name = azurerm_cosmosdb_account.model1_multitenant.resource_group_name
}

data "azurerm_stream_analytics_job" "model1_multitenant" {
  name                = azurerm_stream_analytics_job.model1_multitenant.name
  resource_group_name = azurerm_stream_analytics_job.model1_multitenant.resource_group_name
}

resource "azurerm_stream_analytics_output_cosmosdb" "model1_multitenant" {
  name                     = var.azurerm_stream_analytics_output_cosmosdb_model1_multitenant_name
  stream_analytics_job_id  = data.azurerm_stream_analytics_job.model1_multitenant.id
  cosmosdb_account_key     = data.azurerm_cosmosdb_account.model1_multitenant.primary_key
  cosmosdb_sql_database_id = azurerm_cosmosdb_sql_database.model1_multitenant.id
  container_name           = azurerm_cosmosdb_sql_container.model1_multitenant_devices.name

  depends_on = [
    azurerm_cosmosdb_account.model1_multitenant,
    azurerm_stream_analytics_job.model1_multitenant
  ]

}
