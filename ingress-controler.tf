# resource "kubernetes_ingress" "ingress" {
#   depends_on = [ local_file.kubeconfig ]
#   metadata {
#     name = "bizerba-ingress"
#   }

#   spec {
#     backend {
#       service_name = "MyApp1"
#       service_port = 8080
#     }

#     rule {
#       http {
#         dynamic "path" {
#           for_each = toset(range(var.service_count))
#           content {
#             backend {
#               service_name = "MyApp${path.key}"
#               service_port = 8080
#             }
#             path = "/app${path.key}/*"
#           }
#         }
#       }
#     }

#     tls {
#       secret_name = "tls-secret"
#     }
#   }
#   wait_for_load_balancer = true
# }
