# Non-admin, test-domain
resource "openstack_identity_project_v3" "test-domain" {
  name        = "test-domain"
  description = "Test domain"
  is_domain   = true
  provisioner "local-exec" {
    command = "sed -i -e 's/test_domain_id = .*/test_domain_id = \"${openstack_identity_project_v3.test-domain.id}\"/' ../config.tfvars"
  }
}
