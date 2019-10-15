module "identity" {
    source = "./identity"
}

module "networking" {
    source = "./networking"
}

output "test_domain_id" {
    value = "${module.identity.test_domain_id}"
}

output "domain_admin_role_assignment" {
    # This is used for tracking the dependency.
    # During 'terraform destroy', this role assignment must exist 
    # to destroy projects in this domain. Otherwise, domain-admin
    # user won't be able to destroy projects in test-domain.
    value = "${module.identity.domain_admin_role_assignment}"
}

output "default_admin_role_id" {
    value = "${module.identity.default_admin_role_id}"
}

output "default_member_role_id" {
    value = "${module.identity.default_member_role_id}"
}

output "external_network_id" {
    value = "${module.networking.external_network_id}"
}