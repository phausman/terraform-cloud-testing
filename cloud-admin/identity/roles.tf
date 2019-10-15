data "openstack_identity_role_v3" "member_role" {
    name = "Member"
}

data "openstack_identity_role_v3" "admin_role" {
    name = "Admin"
}