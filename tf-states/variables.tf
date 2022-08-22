variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "resource_group_location" {
  type        = string
  description = "RG location in Azure"
}

variable "random_integer_min_value" {
  type        = number
  description = "Number for min random integer"
}

variable "random_integer_max_value" {
  type        = number
  description = "Number for max random integer"
}

variable "azurerm_storage_account_name" {
  type        = string
  description = "Storage account name"
}

variable "azurerm_storage_account_account_tier" {
  type        = string
  description = "Storage account tier"
}

variable "azurerm_storage_account_replication_type" {
  type        = string
  description = "Storage account replication type"
}

variable "azurerm_storage_account_tag_value" {
  type        = string
  description = "Storage account tag value"
}

variable "azurerm_storage_container_name" {
  type        = string
  description = "Storage container name"
}

variable "azurerm_storage_container_access_type" {
  type        = string
  description = "Storage container access type"
}

