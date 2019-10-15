variable project_admin_role_assignment {}

output "flavor_m1_small_id" {
    value = "${openstack_compute_flavor_v2.m1-small.id}"
}

output "flavor_m1_medium_id" {
    value = "${openstack_compute_flavor_v2.m1-medium.id}"
}

output "flavor_m1_large_id" {
    value = "${openstack_compute_flavor_v2.m1-large.id}"
}