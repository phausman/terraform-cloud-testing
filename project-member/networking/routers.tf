# Attach subnet_1@network_1 to 'external-router-basic-1' router
resource "openstack_networking_router_interface_v2" "external-router-basic-1_interface-1" {
    router_id = "${var.external_router_basic_1_id}"
    subnet_id = "${openstack_networking_subnet_v2.subnet_1.id}"
    depends_on = [var.project_member_role_assignment]
}

# Attach subnet_2@network_2 to 'external-router-basic-2' router
resource "openstack_networking_router_interface_v2" "external-router-basic-2_interface-1" {
    router_id = "${var.external_router_basic_2_id}"
    subnet_id = "${openstack_networking_subnet_v2.subnet_2.id}"
    depends_on = [var.project_member_role_assignment]
}

#
# Internal router with interfaces on network_1 and network_2
#

resource "openstack_networking_router_v2" "internal-router-basic" {
    name = "internal-router-basic"
    admin_state_up = true
    depends_on = [var.project_member_role_assignment]
}

resource "openstack_networking_router_interface_v2" "internal-router-basic_interface-1" {
    router_id = "${openstack_networking_router_v2.internal-router-basic.id}"
    port_id = "${openstack_networking_port_v2.subnet_1-port_1.id}"
    depends_on = [var.project_member_role_assignment]
}

resource "openstack_networking_router_interface_v2" "internal-router-basic_interface-2" {
    router_id = "${openstack_networking_router_v2.internal-router-basic.id}"
    port_id = "${openstack_networking_port_v2.subnet_2-port_1.id}"
    depends_on = [var.project_member_role_assignment]
}
