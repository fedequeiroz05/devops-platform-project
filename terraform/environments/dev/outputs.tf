output "resource_group_name" {
  description = "Nome do Resource Group criado"
  value       = module.resource_group.name
}

output "acr_login_server" {
  description = "Endereço do Container Registry (usado no docker login / push)"
  value       = module.acr.login_server
}

output "acr_name" {
  description = "Nome do ACR criado"
  value       = module.acr.name
}