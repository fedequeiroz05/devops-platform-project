output "resource_group_name" {
  description = "Name of the created Resource Group"
  value       = module.resource_group.name
}

output "acr_login_server" {
  description = "Container Registry address (used for docker login / push)"
  value       = module.acr.login_server
}

output "acr_name" {
  description = "Name of the created ACR"
  value       = module.acr.name
}

output "aks_cluster_name" {
  description = "Name of the created AKS cluster"
  value       = module.aks.cluster_name
}