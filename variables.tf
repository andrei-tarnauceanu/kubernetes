variable "autoscaler_version" {
  default = "v1.21.1"
}

variable "aks_version" {
  default = "1.21.1"
}

variable "aks_name_prefix" {
  default = "bizerba"
}

variable "aks_dns_prefix" {
  default = "aks-cluster-dns"
}

variable "aks_agent_pool" {
  default = "akspool"
}

variable "aks_agent_count" {
  default = "1"
}

variable "aks_agent_count_max" {
  default = "4"
}

variable "aks_linux_admin" {
  default = "azureuser"
}

variable "aks_linux_ssh_key" {}

variable "aks_agent_size" {
  default = "Standard_DS2_v2"
}

variable "main_resource_group_location" {
  default = "East US"
}

variable "main_resource_group_prefix" {
  default = "bizerba"
}

variable "api_server_authorized_ip_ranges" {
  default = ["82.208.160.88/32"]
}

variable "service_principal_id" {}
variable "service_principal_password" {}
variable "service_count" {}

variable "main_vnet_space" {
  default = "10.66.0.0/16"
}

variable "aks_subnets" {
  default = ["10.66.0.0/24", "10.66.1.0/24", "10.66.2.0/24"]
}