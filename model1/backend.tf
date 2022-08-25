terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-multitenant-rg"
    storage_account_name = "tfstate752359"
    container_name       = "tfstate-model1"
    key                  = "terraform.tfstate"
  }
}
