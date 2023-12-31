resource "helm_release" "nats" {
  name       = "nats"
  repository = "https://nats-io.github.io/k8s/helm/charts/"
  chart      = "nats"
  namespace  = var.namespace
  values     = var.values_nats
  version    = var.versions
}

# below config based on your deployment but it sometimes needed when you get an error

resource "kubernetes_manifest" "servicemonitor_hh_staging_nats_hh_staging_nats_service_monitor" {
  manifest = {
    "apiVersion" = "monitoring.coreos.com/v1"
    "kind" = "ServiceMonitor"
    "metadata" = {
      "name" = "staging-nats-service-monitor"
      "namespace" = var.namespace
    }
    "spec" = {
      "endpoints" = [
        {
          "interval" = "15s"
          "port" = "metrics"
          "scrapeTimeout" = "14s"
        },
      ]
      "namespaceSelector" = {
        "matchNames" = [
          "${var.namespace}",
        ]
      }
      "selector" = {
        "matchLabels" = {
          "app.kubernetes.io/instance" = "staging-prometheus"
          "app.kubernetes.io/name" = "prometheus"
        }
      }
    }
  }
}
