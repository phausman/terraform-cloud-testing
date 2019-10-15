resource "openstack_networking_secgroup_v2" "secgroup" {
    name = "secgroup"
    description = "Allow ICMP and SSH from anywhere"
    depends_on = [var.project_member_role_assignment]
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_1" {
    direction = "ingress"
    ethertype = "IPv4"
    protocol = "icmp"
    remote_ip_prefix = "0.0.0.0/0"
    security_group_id = "${openstack_networking_secgroup_v2.secgroup.id}"
    depends_on = [var.project_member_role_assignment]
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_2" {
    direction = "ingress"
    ethertype = "IPv4"
    protocol = "tcp"
    port_range_min = 22
    port_range_max = 22
    remote_ip_prefix = "0.0.0.0/0"
    security_group_id = "${openstack_networking_secgroup_v2.secgroup.id}"
    depends_on = [var.project_member_role_assignment]
}