# Get 'external-router-basic-1' router, created by project-admin
data "openstack_networking_router_v2" "external-router-basic-1" {
  name = "external-router-basic-1"
}

# Attach subnet_1@network_1 to 'external-router-basic-1' router
resource "openstack_networking_router_interface_v2" "external-router-basic-1_interface-1" {
  router_id = "${data.openstack_networking_router_v2.external-router-basic-1.id}"
  subnet_id = "${openstack_networking_subnet_v2.subnet_1.id}"
}

# ------------------------------------------------------------------------------

# Get 'external-router-basic-2' router, created by project-admin
data "openstack_networking_router_v2" "external-router-basic-2" {
  name = "external-router-basic-2"
}

# Attach subnet_2@network_2 to 'external-router-basic-2' router
resource "openstack_networking_router_interface_v2" "external-router-basic-2_interface-1" {
  router_id = "${data.openstack_networking_router_v2.external-router-basic-2.id}"
  subnet_id = "${openstack_networking_subnet_v2.subnet_2.id}"
}

# ------------------------------------------------------------------------------

# Get 'external-router-distributed' router, created by 'project-admin'
data "openstack_networking_router_v2" "external-router-distributed" {
  name = "external-router-distributed"
}

# ------------------------------------------------------------------------------

# Get 'external-router-distributed-snat' router, created by 'project-admin'
data "openstack_networking_router_v2" "external-router-distributed-snat" {
  name = "external-router-distributed-snat"
}

# ------------------------------------------------------------------------------

#
# Internal router with interfaces on network_1 and network_2
#

resource "openstack_networking_router_v2" "internal-router-basic" {
  name                = "internal-router-basic"
  admin_state_up      = true
}

resource "openstack_networking_router_interface_v2" "internal-router-basic_interface-1" {
  router_id = "${openstack_networking_router_v2.internal-router-basic.id}"
  port_id = "${openstack_networking_port_v2.subnet_1-port_1.id}"
}

resource "openstack_networking_router_interface_v2" "internal-router-basic_interface-2" {
  router_id = "${openstack_networking_router_v2.internal-router-basic.id}"
  port_id = "${openstack_networking_port_v2.subnet_2-port_1.id}"
}