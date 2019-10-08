resource "openstack_compute_keypair_v2" "test-keypair" {
  name       = "project-member-keypair"
  public_key = file("~/.ssh/id_rsa.pub")
}