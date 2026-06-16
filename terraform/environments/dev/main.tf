locals {
  common_tags = {
    project     = var.project_name
    environment = var.environment
    managed_by  = "terraform"
  }
}

module "resource_group" {
  source = "../../modules/resource-group"

  resource_group_name = "rg-${var.project_name}-${var.environment}"
  location             = var.location
  tags                  = local.common_tags
}

module "acr" {
  source = "../../modules/acr"

  # Nome deve ser globalmente único em todo o Azure.
  # Ajuste o sufixo se "acrdevopsplatformdev" já estiver em uso.
  acr_name             = "acrdevopsdaherplatform"
  resource_group_name  = module.resource_group.name
  location             = module.resource_group.location
  admin_enabled        = false
  tags                  = local.common_tags
}