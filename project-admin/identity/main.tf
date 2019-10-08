variable "domain_id" {}

output "test-workload-project-id" {
    value = "${data.openstack_identity_project_v3.test-workload-project.id}"
}