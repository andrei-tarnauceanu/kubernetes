resource "local_file" "kubeconfig" {
  depends_on = [azurerm_kubernetes_cluster.aks]
  filename   = pathexpand("~/.kube/config")
  content    = azurerm_kubernetes_cluster.aks.kube_config_raw
}