resource "openstack_networking_floatingip_v2" "fip-1" {
  pool = "ext-net"
}

resource "openstack_networking_floatingip_v2" "fip-2" {
  pool = "ext-net"
}