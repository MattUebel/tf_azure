# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }
  required_version = ">= 0.14.9"


  backend "remote" {
    organization = "mattuebel-dot-org"

    workspaces {
      name = "tf_azure"
    }
  }

}

provider "azurerm" {
  features {}
}

data "azurerm_resources" "storage_account_locations" {
    filter {
        type = "Microsoft.Storage/storageAccounts"
    }
}

output "storage_account_locations_distinct" {
    value = data.azurerm_resources.storage_account_locations.locations
}