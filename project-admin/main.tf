# Variables
variable cloud_admin_password {
  description = "Password for Cloud Admin."
}
variable auth_url {
  description = "Keystone endpoint URL."
}
variable region {
  description = "Cloud region."
}
variable cacert_file {
  description = "Location of the CA certificate file. Empty, if not needed."
}
variable test_domain_id {
  description = "ID of the test domain created by Cloud Admin."
}

provider "openstack" {
  auth_url    = "${var.auth_url}"
  region      = "${var.region}"
  cacert_file = "${var.cacert_file}"

  user_name   = "project-admin"
  password    = "project-admin"

  # Domain scope (impossible to use domain_name because user can't list domains)
  user_domain_id = "${var.test_domain_id}"
  domain_id = "${var.test_domain_id}"

  # Project scope
  tenant_name = "test-workload-project"
  project_domain_id = "${var.test_domain_id}"
}

module "compute" {
    source = "./compute"
}

module "identity" {
    source = "./identity"
    domain_id = "${var.test_domain_id}"
}

module "networking" {
    source = "./networking"
    test-workload-project-id = "${module.identity.test-workload-project-id}"
}