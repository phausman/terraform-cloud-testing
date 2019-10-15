resource "openstack_compute_flavor_v2" "m1-small" {
    name = "m1.small.terraform"
    ram = "2048"
    vcpus = "1"
    disk = "20"
    is_public = true
    depends_on = [var.project_admin_role_assignment]
}

resource "openstack_compute_flavor_v2" "m1-medium" {
    name = "m1.medium.terraform"
    ram = "4096"
    vcpus = "2"
    disk = "40"
    is_public = true
    ephemeral = 2
    depends_on = [var.project_admin_role_assignment]
}

resource "openstack_compute_flavor_v2" "m1-large" {
    name = "m1.large.terraform"
    ram = "8192"
    vcpus = "4"
    disk = "80"
    is_public = true
    depends_on = [var.project_admin_role_assignment]
}