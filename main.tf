terraform {
  required_version = ">= 0.12.20"
}


terraform {
  backend "azurerm" {
    resource_group_name  = "cloud-shell-storage-centralindia"
    storage_account_name = "csg1003200049146824"
    container_name       = "tstate"
    key                  = "terraform.tfstate"
  }
}


provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.23.0"
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "West Europe"
  count = "2"
}


resource "azurerm_resource_group" "Hello-Terraform" {
  name     = "Hello-Terraform"
  location = "West US"
}

