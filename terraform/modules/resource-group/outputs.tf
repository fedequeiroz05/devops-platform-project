output "name" {
  description = "Nome do Resource Group criado"
  value       = azurerm_resource_group.this.name
}

output "location" {
  description = "Localização do Resource Group"
  value       = azurerm_resource_group.this.location
}

output "id" {
  description = "ID do Resource Group"
  value       = azurerm_resource_group.this.id
}