#
# Network 1
# 

resource "openstack_networking_network_v2" "network_1" {
    name = "test-network-1"
    admin_state_up = "true"
    dns_domain = "compute.example.com."
    mtu = "${var.mtu}"
    depends_on = [var.project_member_role_assignment]
}

resource "openstack_networking_subnet_v2" "subnet_1" {
    network_id = "${openstack_networking_network_v2.network_1.id}"
    cidr = "192.168.198.0/24"
    name = "subnet_1"
    allocation_pool {
        start = "192.168.198.10"
        end = "192.168.198.254"
    }
    depends_on = [var.project_member_role_assignment]
}

# Port for internal-router-basic
resource "openstack_networking_port_v2" "subnet_1-port_1" {
    name = "port_1"
    network_id = "${openstack_networking_network_v2.network_1.id}"
    admin_state_up = "true"
    fixed_ip {
        subnet_id = "${openstack_networking_subnet_v2.subnet_1.id}"
        ip_address = "192.168.198.9"
    }
    depends_on = [var.project_member_role_assignment]
}


# Network 2
resource "openstack_networking_network_v2" "network_2" {
    name = "test-network-2"
    admin_state_up = "true"
    mtu = "${var.mtu}"
    depends_on = [var.project_member_role_assignment]
}

resource "openstack_networking_subnet_v2" "subnet_2" {
    network_id = "${openstack_networking_network_v2.network_2.id}"
    cidr = "192.168.199.0/24"
    name = "subnet_2"
    allocation_pool {
        start = "192.168.199.10"
        end = "192.168.199.254"
    }
    depends_on = [var.project_member_role_assignment]
}

# Port for internal-router-basic
resource "openstack_networking_port_v2" "subnet_2-port_1" {
    name = "port_1"
    network_id = "${openstack_networking_network_v2.network_2.id}"
    admin_state_up = "true"
    fixed_ip {
        subnet_id    = "${openstack_networking_subnet_v2.subnet_2.id}"
        ip_address   = "192.168.199.9"
    }
    depends_on = [var.project_member_role_assignment]
}