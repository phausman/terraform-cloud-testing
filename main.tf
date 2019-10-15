variable cloud_admin_name {
    default = "admin"
    description = "Username of Cloud Admin"
}
variable cloud_admin_password {
    description = "Cloud Admin's password"
}
variable cloud_admin_project {
    default = "admin"
    description = "Default project for Cloud Admin"
}
variable cloud_admin_domain {
    default = "admin_domain"
    description = "Domain name for Cloud Admin"
}
variable auth_url {
    description = "Keystone endpoint URL"
}
variable region {
    default = "RegionOne"
    description = "OpenStack region name"
}
variable cacert {
    default = ""
    description = "CA certificate to connect to Keystone endpoint URL"
}
variable mtu {
    default = "1500"
    description = "MTU for internal networks"
}

provider "openstack" {
    user_name = var.cloud_admin_name
    password = var.cloud_admin_password

    tenant_name = var.cloud_admin_project
    domain_name = var.cloud_admin_domain
  
    auth_url = var.auth_url
    region = var.region
    cacert_file = var.cacert
}

provider "openstack" {
    alias = "domain-admin"

    user_name = "domain-admin"
    password = "domain-admin"

    tenant_name = ""
    domain_name = ""

    user_domain_id = "${module.cloud-admin.test_domain_id}"
    domain_id = "${module.cloud-admin.test_domain_id}"
  
    auth_url = var.auth_url
    region = var.region
    cacert_file = var.cacert

    delayed_auth = true
}

provider "openstack" {
    alias = "project-admin"

    user_name = "project-admin"
    password = "project-admin"

    domain_name = ""

    # Domain scope (impossible to use domain_name because user can't list domains)
    user_domain_id = "${module.cloud-admin.test_domain_id}"
    domain_id = "${module.cloud-admin.test_domain_id}"

    # Project scope
    tenant_name = "test-workload-project"
    project_domain_id = "${module.cloud-admin.test_domain_id}"
  
    auth_url = var.auth_url
    region = var.region
    cacert_file = var.cacert

    delayed_auth = true
}

provider "openstack" {
    alias = "project-member"

    user_name = "project-member"
    password = "project-member"

    domain_name = ""

    # Domain scope (impossible to use domain_name because user can't list domains)
    user_domain_id = "${module.cloud-admin.test_domain_id}"
    domain_id = "${module.cloud-admin.test_domain_id}"

    # Project scope
    tenant_name = "test-workload-project"
    project_domain_id = "${module.cloud-admin.test_domain_id}"
  
    auth_url = var.auth_url
    region = var.region
    cacert_file = var.cacert

    delayed_auth = true
}

module "cloud-admin" {
    source = "./cloud-admin"
}

module "domain-admin" {
    source = "./domain-admin"
    
    providers = {
        openstack = openstack.domain-admin
    }

    test_domain_id = "${module.cloud-admin.test_domain_id}"
    domain_admin_role_assignment = "${module.cloud-admin.domain_admin_role_assignment}"
    default_admin_role_id = "${module.cloud-admin.default_admin_role_id}"
    default_member_role_id = "${module.cloud-admin.default_member_role_id}"
}

module "project-admin" {
    source = "./project-admin"
    
    providers = {
        openstack = openstack.project-admin
    }

    test_domain_id = "${module.cloud-admin.test_domain_id}"
    external_network_id = "${module.cloud-admin.external_network_id}"
    project_admin_role_assignment = "${module.domain-admin.project_admin_role_assignment}"
    test_workload_project_id = "${module.domain-admin.test_workload_project_id}"
}

module "project-member" {
    source = "./project-member"
    
    providers = {
        openstack = openstack.project-member
    }

    test_domain_id = "${module.cloud-admin.test_domain_id}"
    project_admin_role_assignment = "${module.domain-admin.project_admin_role_assignment}"
    project_member_role_assignment = "${module.domain-admin.project_member_role_assignment}"
    external_router_basic_1_id = "${module.project-admin.external_router_basic_1_id}"
    external_router_basic_2_id = "${module.project-admin.external_router_basic_2_id}"

    flavor_m1_small_id = "${module.project-admin.flavor_m1_small_id}"
    flavor_m1_medium_id = "${module.project-admin.flavor_m1_medium_id}"
    flavor_m1_large_id = "${module.project-admin.flavor_m1_large_id}"

    mtu = "${var.mtu}"
}