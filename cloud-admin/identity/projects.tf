# Project for administrative purposes in 'test-domain' domain
resource "openstack_identity_project_v3" "test-admin-project" {
    name = "test-admin-project"
    description = "Test admin project"
    domain_id = "${openstack_identity_project_v3.test-domain.id}"
}