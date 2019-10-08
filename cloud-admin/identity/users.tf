# Data
data "openstack_identity_role_v3" "member_role" {
  name = "Member"
}

data "openstack_identity_role_v3" "admin_role" {
  name = "Admin"
}


#
# 'test-domain' domain
#

# User with 'Admin' role in 'test-domain' domain
resource "openstack_identity_user_v3" "domain-admin" {
  domain_id          = "${openstack_identity_project_v3.test-domain.id}"
  default_project_id = "${openstack_identity_project_v3.test-admin-project.id}"
  name               = "domain-admin"
  description        = "Domain admin"
  password           = "domain-admin"
  ignore_change_password_upon_first_use = true
  multi_factor_auth_enabled = false
}

# Role assignment (user has 'Admin' role in 'test-domain' domain)
resource "openstack_identity_role_assignment_v3" "role_assignment_20" {
  user_id    = "${openstack_identity_user_v3.domain-admin.id}"
  domain_id  = "${openstack_identity_project_v3.test-domain.id}"
  role_id    = data.openstack_identity_role_v3.admin_role.id
}

# Role assignment (user has 'Admin' role in project 'test-admin-project')
resource "openstack_identity_role_assignment_v3" "role_assignment_30" {
  user_id    = "${openstack_identity_user_v3.domain-admin.id}"
  project_id = "${openstack_identity_project_v3.test-admin-project.id}"
  role_id    = data.openstack_identity_role_v3.admin_role.id
}