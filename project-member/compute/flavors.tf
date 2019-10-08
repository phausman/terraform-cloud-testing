# Flavors are created by 'project-admin'

data "openstack_compute_flavor_v2" "m1-small" {
  name = "m1.small.terraform"
}

data "openstack_compute_flavor_v2" "m1-medium" {
  name = "m1.medium.terraform"
}

data "openstack_compute_flavor_v2" "m1-large" {
  name = "m1.large.terraform"
}