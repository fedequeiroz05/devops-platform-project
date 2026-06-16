output "id" {
  description = "ID do Azure Container Registry"
  value       = azurerm_container_registry.this.id
}

output "login_server" {
  description = "URL do registry (ex: meuacr.azurecr.io) usada para docker push/pull"
  value       = azurerm_container_registry.this.login_server
}

output "name" {
  description = "Nome do ACR"
  value       = azurerm_container_registry.this.name
}