# Variables
variable "test_domain_id" {
  description = "ID of the new domain created by Cloud Admin."
}

provider "openstack" {
  auth_url    = "${var.auth_url}"
  region      = "${var.region}"
  cacert_file = "${var.cacert_file}"

  user_name   = "domain-admin"
  password    = "domain-admin"

  user_domain_id = "${var.test_domain_id}"
  domain_id = "${var.test_domain_id}"
}

module "identity" {
    source = "./identity"
    domain_id = "${var.test_domain_id}"
}