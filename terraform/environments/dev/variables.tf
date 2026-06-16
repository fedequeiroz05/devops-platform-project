variable "project_name" {
  description = "Nome curto do projeto, usado como prefixo nos recursos"
  type        = string
  default     = "devopsplatform"
}

variable "location" {
  description = "Região Azure"
  type        = string
  default     = "westus"
}

variable "environment" {
  description = "Nome do ambiente"
  type        = string
  default     = "dev"
}