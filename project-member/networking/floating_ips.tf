resource "openstack_networking_floatingip_v2" "fip-1" {
    pool = "ext-net"
    depends_on = [var.project_member_role_assignment, 
                  openstack_networking_router_interface_v2.external-router-basic-2_interface-1]
}

resource "openstack_networking_floatingip_v2" "fip-2" {
    pool = "ext-net"
    depends_on = [var.project_member_role_assignment, 
                  openstack_networking_router_interface_v2.external-router-basic-1_interface-1]
}