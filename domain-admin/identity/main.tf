variable "domain_id" {}
variable "domain_admin_role_assignment" {}
variable "default_admin_role_id" {}
variable "default_member_role_id" {}

output "project_admin_role_assignment" {
    value = "${openstack_identity_role_assignment_v3.role_assignment_admin.id}"
}
output "project_member_role_assignment" {
    value = "${openstack_identity_role_assignment_v3.role_assignment_member.id}"
}

output "test_workload_project_id" {
    value = "${openstack_identity_project_v3.test-workload-project.id}"
}