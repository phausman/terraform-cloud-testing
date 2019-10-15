variable "test_domain_id" {
    description = "ID of the test domain created by Cloud Admin."
}
variable "domain_admin_role_assignment" {}
variable "default_admin_role_id" {}
variable "default_member_role_id" {}

module "identity" {
    source = "./identity"
    domain_id = "${var.test_domain_id}"
    domain_admin_role_assignment = "${var.domain_admin_role_assignment}"
    default_admin_role_id = "${var.default_admin_role_id}"
    default_member_role_id = "${var.default_member_role_id}"
}

output "project_admin_role_assignment" {
    value = "${module.identity.project_admin_role_assignment}"
}
output "project_member_role_assignment" {
    value = "${module.identity.project_member_role_assignment}"
}
output "test_workload_project_id" {
    value = "${module.identity.test_workload_project_id}"
}