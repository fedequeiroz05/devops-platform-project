terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.95"
    }
  }

  # Por padrão o estado fica local (terraform.tfstate na sua máquina).
  # Isso é ACEITÁVEL para um projeto de portfólio individual.
  # Em um time real, isso viraria um backend remoto, por exemplo:
  #
  # backend "azurerm" {
  #   resource_group_name  = "rg-terraform-state"
  #   storage_account_name = "sttfstateunique"
  #   container_name       = "tfstate"
  #   key                  = "dev.terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
}