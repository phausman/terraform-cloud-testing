# Non-admin, test-domain
resource "openstack_identity_project_v3" "test-domain" {
    name = "test-domain"
    description = "Test domain"
    is_domain = true
}