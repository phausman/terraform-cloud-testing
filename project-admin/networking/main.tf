variable "external_network_id" {}
variable "project_admin_role_assignment" {}
variable "test_workload_project_id" {}

output "external_router_basic_1_id" {
    value = "${openstack_networking_router_v2.external-router-basic-1.id}"
}

output "external_router_basic_2_id" {
    value = "${openstack_networking_router_v2.external-router-basic-2.id}"
}