data "openstack_identity_project_v3" "test-workload-project" {
  name = "test-workload-project"
  domain_id = "${var.domain_id}"
}