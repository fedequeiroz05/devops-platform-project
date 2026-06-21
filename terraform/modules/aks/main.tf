resource "azurerm_kubernetes_cluster" "this" {
  name                = var.cluster_name
  resource_group_name = var.resource_group_name
  location            = var.location

  # This becomes part of internal DNS names for the cluster.
  dns_prefix = var.dns_prefix

  # "Free" is the only tier with no charge for the control plane.
  # "Standard"/"Premium" add an SLA and cost a flat fee per hour regardless
  # of usage — not worth it for a portfolio project you tear down often.
  sku_tier = "Free"

  default_node_pool {
    name       = "system"
    node_count = var.node_count

    # Burstable B-series is the cheapest VM family that still works with
    # AKS system pods. Not suitable for real production workloads, but
    # perfectly fine for demoing the platform.
    vm_size = var.vm_size

    # Disabled on purpose: for a single-developer portfolio cluster,
    # autoscaling adds complexity and potential surprise costs without
    # adding anything to the story you're telling in an interview.
    enable_auto_scaling = false
  }

  # System-assigned managed identity: Azure creates and rotates the
  # identity automatically. No Service Principal secret to store or leak.
  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}