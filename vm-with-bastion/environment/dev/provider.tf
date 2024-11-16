terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
}

provider "azurerm" {
    subscription_id = "a4a45eb7-4a40-43cb-a5db-ffccb48c94a3"
  features {

  }
}