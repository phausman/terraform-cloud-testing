// # Distributed external router
// resource "openstack_networking_router_v2" "external-router-distributed" {
//   name                = "external-router-distributed"
//   admin_state_up      = true
//   external_network_id = "${data.openstack_networking_network_v2.ext-net.id}"
//   distributed         = true
//   tenant_id           = "${var.test_workload_project_id}"
// }

// # Distributed with SNAT external router
// resource "openstack_networking_router_v2" "external-router-distributed-snat" {
//   name                = "external-router-distributed-snat"
//   admin_state_up      = true
//   external_network_id = "${data.openstack_networking_network_v2.ext-net.id}"
//   distributed         = true
//   enable_snat         = true
//   tenant_id           = "${var.test_workload_project_id}"
// }