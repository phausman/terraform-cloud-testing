data "openstack_identity_project_v3" "test-admin-project" {
  name = "test-admin-project"
}

# Project
resource "openstack_identity_project_v3" "test-workload-project" {
  name        = "test-workload-project"
  description = "Test workload project"
  domain_id   = "${var.domain_id}"
}