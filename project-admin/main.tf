variable "test_domain_id" {
    description = "ID of the test domain created by Cloud Admin."
}
variable "external_network_id" {}
variable "project_admin_role_assignment" {}
variable "test_workload_project_id" {}

output "external_router_basic_1_id" {
    value = "${module.networking.external_router_basic_1_id}"
}

output "external_router_basic_2_id" {
    value = "${module.networking.external_router_basic_2_id}"
}

output "flavor_m1_small_id" {
    value = "${module.compute.flavor_m1_small_id}"
}

output "flavor_m1_medium_id" {
    value = "${module.compute.flavor_m1_medium_id}"
}

output "flavor_m1_large_id" {
    value = "${module.compute.flavor_m1_large_id}"
}

module "compute" {
    source = "./compute"
    project_admin_role_assignment = var.project_admin_role_assignment
}

module "networking" {
    source = "./networking"
    test_workload_project_id = "${var.test_workload_project_id}"
    external_network_id = "${var.external_network_id}"
    project_admin_role_assignment = var.project_admin_role_assignment
}