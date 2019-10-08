# Data
data "openstack_identity_role_v3" "member_role" {
  name = "Member"
}

data "openstack_identity_role_v3" "admin_role" {
  name = "Admin"
}

# ------------------------------------------------------------------------------

# Project admin
resource "openstack_identity_user_v3" "project-admin" {
  domain_id          = "${var.domain_id}"
  default_project_id = "${openstack_identity_project_v3.test-workload-project.id}"
  name               = "project-admin"
  password           = "project-admin"
  description        = "A user with Admin role on 'test-workload-project' project"
  ignore_change_password_upon_first_use = true
  multi_factor_auth_enabled = false
}

# Role assignment (user is a project Member)
resource "openstack_identity_role_assignment_v3" "role_assignment_admin" {
  user_id    = "${openstack_identity_user_v3.project-admin.id}"
  project_id = "${openstack_identity_project_v3.test-workload-project.id}"
  role_id    = "${data.openstack_identity_role_v3.admin_role.id}"
}

# ------------------------------------------------------------------------------

# Project member
resource "openstack_identity_user_v3" "project-member" {
  domain_id          = "${var.domain_id}"
  default_project_id = "${openstack_identity_project_v3.test-workload-project.id}"
  name               = "project-member"
  password           = "project-member"
  description        = "A user with Member role on 'test-workload-project' project"
  ignore_change_password_upon_first_use = true
  multi_factor_auth_enabled = false
}

# Role assignment (user is a project Member)
resource "openstack_identity_role_assignment_v3" "role_assignment_member" {
  user_id    = "${openstack_identity_user_v3.project-member.id}"
  project_id = "${openstack_identity_project_v3.test-workload-project.id}"
  role_id    = "${data.openstack_identity_role_v3.member_role.id}"
}