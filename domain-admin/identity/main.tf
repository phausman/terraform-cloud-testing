variable "domain_id" {}

output "test-admin-project-id" {
    value = "${data.openstack_identity_project_v3.test-admin-project.id}"
}