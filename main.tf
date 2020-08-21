terraform {
  required_version = ">= 0.12.20"
}

provider "aws" {
  region = "us-east-1"
}

resource "random_integer" "rand" {
  min = 10000
  max = 99999
}

module "resource-group" {
  source  = "sanjeevmagoo/resource-group/azurerm"
  version = "0.1.0"
  name = "RG-Using-Modules"
  location = "East US"
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
  name     = "unique-name-${random_integer.rand.result}"
  location = "West Europe"
  
  provisioner "local-exec" {
    command = "echo ${azurerm_resource_group.example.name} >> rg.txt"
  }
  
}
  
  output resource_name {
    value = var.mylist[2]
    }
  
  variable "mylist" {
    type = list
    default = [1,2,3,4]
    }
