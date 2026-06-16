variable "resource_group_name" {
  description = "Nome do Resource Group"
  type        = string
}

variable "location" {
  description = "Região Azure onde os recursos serão criados"
  type        = string
  default     = "westus"
}

variable "tags" {
  description = "Tags aplicadas ao Resource Group"
  type        = map(string)
  default     = {}
}