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

provider "openstack" {
  user_name   = "admin"
  tenant_name = "admin"
  domain_name = "admin_domain"
  password    = "${var.cloud_admin_password}"
  auth_url    = "${var.auth_url}"
  region      = "${var.region}"
  cacert_file = "${var.cacert_file}"
}

module "identity" {
    source = "./identity"
}

module "networking" {
    source = "./networking"
}

output "test-domain-id" {
    value = "${module.identity.test-domain-id}"
}
