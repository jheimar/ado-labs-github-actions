##################################################################################
# LOCALS
##################################################################################


locals {
  resource_group_name = "${var.naming_prefix}-${random_integer.name_suffix.result}"
  app_service_plan_name = "${var.naming_prefix}-${random_integer.name_suffix.result}"
  app_service_name = "${var.naming_prefix}-${random_integer.name_suffix.result}"
}

resource "random_integer" "name_suffix" {
  min = 10000
  max = 99999
}

#resource "azurerm_kubernetes_cluster" "kallsony_aks" {
#  name                = "kallsony-aks1"
#  location            = "eastus"
#  resource_group_name = "kallsony_rg"
#  dns_prefix          = "kallsonyks1"
#  default_node_pool {
#    name       = "default"
#    node_count = 1
#   vm_size    = "Standard_D2_v2"
#  }
#
#  identity {
#    type = "SystemAssigned"
#  }
#
#  tags = {
#    Environment = "Dev"
#  }
#}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.kallsony_aks.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.kallsony_aks.kube_config_raw

  sensitive = true
}

##################################################################################
# APP SERVICE
##################################################################################

#resource "azurerm_resource_group" "app_service" {
#  name     = local.resource_group_name
#  location = var.location
#}

#resource "azurerm_app_service_plan" "app_service" {
#  name                = local.app_service_plan_name
#  location            = "eastus"
#  resource_group_name = "kallsony_rg"
#
#  sku {
#    tier = var.asp_tier
#    size = var.asp_size
#    capacity = var.capacity
#  }
#}
#
#resource "azurerm_app_service" "app_service" {
#  name                = local.app_service_name
#  location            = "eastus"
#  resource_group_name = "kallsony_rg"
#  app_service_plan_id = azurerm_app_service_plan.app_service.id
#  
#  source_control {
#    repo_url = "https://github.com/ned1313/nodejs-docs-hello-world"
#    branch = "main"
#    manual_integration = true
#    use_mercurial = false
#  }
#}