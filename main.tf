terraform {
  required_version = ">= 0.12.20"
}

terraform {   
 backend "azurerm" {     
 storage_account_name  = "csg1003200049146824 "     
 container_name        = "tstate"     
 key                   = "terraform.tfstate"
 use_msi               = true
 subscription_id       = "413dc411-db88-4292-b3a0-4bbf10eff75e"
 tenant_id             = "872b50a3-f641-4a7d-b1c4-cce3c3da9318"   
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
}


resource "azurerm_resource_group" "Hello-Terraform" {
  name     = "Hello-Terraform"
  location = "West US"
}

