module "helm_nats" {
 
  source                    = "./nats-resource"
  values_nats               = [file("./nats-resource/values.yaml")]
  # values_nats_prom_exporter = [file("../../../../modules/k8s/helm/nats/prometheus-nats-exporter/values.yaml")]
  namespace                 = "hey-apply-your-namespace"
  depends_on                = [module.k8s_namespaces,module.monitoring_crd]


}