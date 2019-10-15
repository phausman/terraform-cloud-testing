variable test_domain_id {
    description = "ID of the test domain created by Cloud Admin."
}

variable "project_admin_role_assignment" {}
variable "project_member_role_assignment" {}
variable "external_router_basic_1_id" {}
variable "external_router_basic_2_id" {}

variable "flavor_m1_small_id" {}
variable "flavor_m1_medium_id" {}
variable "flavor_m1_large_id" {}

variable "mtu" {}

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
    project_member_role_assignment = var.project_member_role_assignment
    flavor_m1_small_id = var.flavor_m1_small_id
    flavor_m1_medium_id = var.flavor_m1_medium_id
    flavor_m1_large_id = var.flavor_m1_large_id
}

module "image" {
    source = "./image"
    project_member_role_assignment = var.project_member_role_assignment
}

module "networking" {
    source = "./networking"
    project_member_role_assignment = var.project_member_role_assignment
    external_router_basic_1_id = var.external_router_basic_1_id
    external_router_basic_2_id = var.external_router_basic_2_id
    mtu = var.mtu
}

module "volume" {
    source = "./volume"
    cirros_image_id = "${module.image.cirros_image_id}"
    project_member_role_assignment = var.project_member_role_assignment
}

module "dns" {
    source = "./dns"
    project_member_role_assignment = var.project_member_role_assignment
}

module "object" {
    source = "./object"
    project_member_role_assignment = var.project_member_role_assignment
}