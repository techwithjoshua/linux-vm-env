# specifies required providers and their versions
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.22.0"
    }
  }
}

# configures provider
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# creates resource group
resource "azurerm_resource_group" "terraform_test" {
  name     = "terraform-test"
  location = "East US"
}
