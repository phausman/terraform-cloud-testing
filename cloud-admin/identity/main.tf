output "test_domain_id" {
    value = "${openstack_identity_project_v3.test-domain.id}"
}

output "domain_admin_role_assignment" {
    value = "${openstack_identity_role_assignment_v3.role-asignment_admin-in-test-domain.id}"
}

output "default_admin_role_id" {
    value = "${data.openstack_identity_role_v3.admin_role.id}"
}

output "default_member_role_id" {
    value = "${data.openstack_identity_role_v3.member_role.id}"
}