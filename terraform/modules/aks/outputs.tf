output "cluster_name" {
  description = "Name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.this.name
}

output "kube_config_raw" {
  description = "Raw kubeconfig for connecting kubectl/helm to this cluster"
  value       = azurerm_kubernetes_cluster.this.kube_config_raw
  sensitive   = true
}

output "host" {
  description = "Kubernetes API server endpoint"
  value       = azurerm_kubernetes_cluster.this.kube_config.0.host
  sensitive   = true
}

output "kubelet_identity_object_id" {
  description = "Object ID of the cluster's managed identity (used later to grant ACR pull permissions)"
  value       = azurerm_kubernetes_cluster.this.kubelet_identity.0.object_id
}