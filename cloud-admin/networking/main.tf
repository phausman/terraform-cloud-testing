output "external_network_id" {
    value = "${data.openstack_networking_network_v2.ext-net.id}"
}