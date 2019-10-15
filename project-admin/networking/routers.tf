# Basic external router
resource "openstack_networking_router_v2" "external-router-basic-1" {
    name = "external-router-basic-1"
    admin_state_up = true
    external_network_id = "${var.external_network_id}"
    tenant_id = "${var.test_workload_project_id}"
    depends_on = [var.project_admin_role_assignment]
}

resource "openstack_networking_router_v2" "external-router-basic-2" {
    name = "external-router-basic-2"
    admin_state_up = true
    external_network_id = "${var.external_network_id}"
    tenant_id = "${var.test_workload_project_id}"
    depends_on = [var.project_admin_role_assignment]
}