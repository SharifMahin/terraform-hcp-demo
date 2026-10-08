terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  cloud {
    organization = "<your-hcp-org-name>"

    workspaces {
      name = "terraform-hcp-demo"
    }
  }
}

provider "azurerm" {
  features {}
}
