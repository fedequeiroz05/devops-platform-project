resource "azurerm_container_registry" "this" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location

  # SKU "Basic" é suficiente para portfólio/estudo e é a opção mais barata.
  # Standard/Premium adicionam replicação geográfica e mais throughput,
  # mas custam mais e não são necessários aqui.
  sku = "Basic"

  # Desabilitado por padrão: usar autenticação via Managed Identity / Service
  # Principal é a prática recomendada em vez de admin user + senha estática.
  admin_enabled = var.admin_enabled

  tags = var.tags
}