variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group where the cluster will be created"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix used to form the cluster's internal FQDN"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the default node pool"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "VM size for the default node pool. B-series (burstable) would be cheaper but is blocked on this subscription; D2s_v6 is the cheapest allowed alternative."
  type        = string
  default     = "Standard_D2s_v6"
}

variable "tags" {
  description = "Tags applied to the cluster"
  type        = map(string)
  default     = {}
}