resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.aks_name_prefix}-${terraform.workspace}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = var.aks_dns_prefix

  kubernetes_version              = var.aks_version
  # api_server_authorized_ip_ranges = toset(var.api_server_authorized_ip_ranges)
  linux_profile {
    admin_username = var.aks_linux_admin

    ssh_key {
      key_data = var.aks_linux_ssh_key
    }

  }
  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "Standard"
  }

  default_node_pool {
    name                = var.aks_agent_pool
    node_count          = var.aks_agent_count
    vm_size             = var.aks_agent_size
    enable_auto_scaling = true
    os_sku              = "Ubuntu"
    os_disk_size_gb     = 30
    max_count           = var.aks_agent_count_max
    min_count           = var.aks_agent_count
    enable_node_public_ip = true
  }

  service_principal {
    client_id     = var.service_principal_id
    client_secret = var.service_principal_password
  }
  addon_profile {
    http_application_routing {
      enabled = true
    }
  }
}