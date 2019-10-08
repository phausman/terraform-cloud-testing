# Basic external router
resource "openstack_networking_router_v2" "external-router-basic-1" {
  name                = "external-router-basic-1"
  admin_state_up      = true
  external_network_id = "${data.openstack_networking_network_v2.ext-net.id}"
  tenant_id           = "${var.test-workload-project-id}"
}

resource "openstack_networking_router_v2" "external-router-basic-2" {
  name                = "external-router-basic-2"
  admin_state_up      = true
  external_network_id = "${data.openstack_networking_network_v2.ext-net.id}"
  tenant_id           = "${var.test-workload-project-id}"
}

# UNCOMMENT IF YOUR CLOUD SUPPORTS DVR

## Distributed external router (uncomment if you cloud supports DVR)
# resource "openstack_networking_router_v2" "external-router-distributed" {
#   name                = "external-router-distributed"
#   admin_state_up      = true
#   external_network_id = "${data.openstack_networking_network_v2.ext-net.id}"
#   distributed         = true
#   tenant_id           = "${var.test-workload-project-id}"
# }

# UNCOMMENT IF YOUR CLOUD SUPPORTS DVR

## Distributed with SNAT external router (uncomment if you cloud supports DVR)
# resource "openstack_networking_router_v2" "external-router-distributed-snat" {
#   name                = "external-router-distributed-snat"
#   admin_state_up      = true
#   external_network_id = "${data.openstack_networking_network_v2.ext-net.id}"
#   distributed         = true
#   enable_snat         = true
#   tenant_id           = "${var.test-workload-project-id}"
# }
