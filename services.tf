# resource "kubernetes_service" "application" {
#   depends_on = [ local_file.kubeconfig ]
#   count = var.service_count
#   metadata {
#     name = "myapp${count.index}.example.com"
#   }
#   spec {
#     selector = {
#       app = kubernetes_pod.my_app_pod[count.index].metadata.0.labels.app
#     }
#     session_affinity = "ClientIP"
#     port {
#       port        = 8080
#       target_port = 80
#     }

#     type = "LoadBalancer"
#   }
# }

# resource "kubernetes_pod" "my_app_pod" {
#   depends_on = [ local_file.kubeconfig ]
#   count = var.service_count
#   metadata {
#     name = "myapp${count.index}.example.com"
#     labels = {
#       app = "MyApp${count.index}"
#     }
#   }

#   spec {
#     container {
#       image = "nginx:1.7.9"
#       name  = "example"
#     }
#     volume {
#       azure_file {
#         secret_name = azurerm_key_vault_secret.file_share.name
#         share_name  = azurerm_storage_share.file_share.name
#         read_only   = false
#       }
#     }
#   }
# }