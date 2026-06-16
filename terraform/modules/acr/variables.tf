variable "acr_name" {
  description = "Nome do Azure Container Registry (deve ser globalmente único, somente letras e números)"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9]{5,50}$", var.acr_name))
    error_message = "O nome do ACR deve ter entre 5 e 50 caracteres alfanuméricos, sem espaços ou hífens."
  }
}

variable "resource_group_name" {
  description = "Nome do Resource Group onde o ACR será criado"
  type        = string
}

variable "location" {
  description = "Região Azure"
  type        = string
}

variable "admin_enabled" {
  description = "Habilita usuário admin no ACR (use false em produção; prefira Service Principal/Managed Identity)"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags aplicadas ao ACR"
  type        = map(string)
  default     = {}
}