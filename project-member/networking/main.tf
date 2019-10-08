variable mtu {}

output "tenant_network_id" {
    value = "${openstack_networking_network_v2.network_1.id}"
}

output "tenant_network_2_id" {
    value = "${openstack_networking_network_v2.network_2.id}"
}

output "fip_1_address" {
    value = "${openstack_networking_floatingip_v2.fip-1.address}"
}

output "fip_2_address" {
    value = "${openstack_networking_floatingip_v2.fip-2.address}"
}
