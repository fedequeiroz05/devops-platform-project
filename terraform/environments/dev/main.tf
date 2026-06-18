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

  acr_name             = "acrdevopsdaherplatform"
  resource_group_name  = module.resource_group.name
  location             = module.resource_group.location
  admin_enabled        = false
  tags                  = local.common_tags
}

module "aks" {
  source = "../../modules/aks"

  cluster_name         = "aks-${var.project_name}-${var.environment}"
  resource_group_name  = module.resource_group.name
  location             = module.resource_group.location
  dns_prefix           = "${var.project_name}-${var.environment}"
  node_count           = 1
  vm_size              = "Standard_D2s_v6"
  tags                  = local.common_tags
}

# Grants the AKS cluster's managed identity permission to pull images
# from the ACR. Without this, kubectl/Helm deployments referencing
# images in your ACR will fail with an "ImagePullBackOff" error.
resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                = module.acr.id
  role_definition_name = "AcrPull"
  principal_id          = module.aks.kubelet_identity_object_id
}