module "cp4d-instance" {
  source = "./module"

  depends_on = [
    module.gitops_cp4d_operator,
    module.gitops_global_pullsecret_synch
  ]

  gitops_config = module.gitops.gitops_config
  git_credentials = module.gitops.git_credentials
  server_name = module.gitops.server_name
  namespace = module.dev_tools_namespace.name
  cpd_operator_namespace = module.gitops_cpd_operator_namespace.name
  kubeseal_cert = module.gitops.sealed_secrets_cert
  #entitlement_key = var.cp_entitlement_key
}
