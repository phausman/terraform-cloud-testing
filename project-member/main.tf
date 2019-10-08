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
  auth_url    = "https://keystone.uk.stack.dnae.com:5000/v3"
  region      = "uk"
  cacert_file = "../cacert-dnae.pem"

  user_name   = "project-member"
  password    = "project-member"

  # Domain scope (impossible to use domain_name because user can't list domains)
  user_domain_id = "${var.test_domain_id}"
  domain_id = "${var.test_domain_id}"

  # Project scope
  tenant_name = "test-workload-project"
  project_domain_id = "${var.test_domain_id}"
}

module "compute" {
    source = "./compute"
    cirros_image_id = "${module.image.cirros_image_id}"
    bionic_image_id = "${module.image.bionic_image_id}"
    tenant_network_id = "${module.networking.tenant_network_id}"
    tenant_network_2_id = "${module.networking.tenant_network_2_id}"
    volume_1_id = "${module.volume.volume_1_id}"
    volume_2_id = "${module.volume.volume_2_id}"
    volume_from_cirros_image_id = "${module.volume.volume_from_cirros_image_id}"
    fip_1_address = "${module.networking.fip_1_address}"
    fip_2_address = "${module.networking.fip_2_address}"
}

module "image" {
    source = "./image"
}

module "networking" {
    source = "./networking"
}

module "volume" {
    source = "./volume"
    cirros_image_id = "${module.image.cirros_image_id}"
}

module "dns" {
    source = "./dns"
}

module "object" {
    source = "./object"
}