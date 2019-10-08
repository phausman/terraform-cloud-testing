data "template_file" "config" {
  template = "${file("../config.json")}"
}

provider "openstack" {
  user_name   = "${data.template_file.cloud_admin.user_name.rendered}"
  tenant_name = "${data.template_file.cloud_admin.tenant_name.rendered}"
  domain_name = "${data.template_file.cloud_admin.domain_name.rendered}"
  password    = "${data.template_file.cloud_admin.password.rendered}"
  auth_url    = "${data.template_file.cloud_admin.auth_url.rendered}"
  region      = "${data.template_file.cloud_admin.region.rendered}"
  cacert_file = "${data.template_file.cloud_admin.cacert_file.rendered}"
}

module "identity" {
    source = "./identity"
}

module "networking" {
    source = "./networking"
}
