#####
# NATS metrics Monitoring CRD
#####
module "monitoring_crd"{
  source = "./service-monitor-crd"
}
##########
# NATS
############
module "helm_nats" {
 
  source                    = "./nats-resource"
  values_nats               = [file("./nats-resource/values.yaml")]
  namespace                 = "hey-apply-your-namespace"
  depends_on                = [module.monitoring_crd]
  version = "if you need"
}
