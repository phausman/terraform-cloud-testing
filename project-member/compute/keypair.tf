resource "openstack_compute_keypair_v2" "test-keypair" {
    name = "project-member-keypair"
    public_key = file("~/.ssh/id_rsa.pub")
    depends_on = [var.project_member_role_assignment]
}