# Introducation

Before creating the infrastructure, make sure the following resources
are already existing in the cloud:

  - external network named 'ext-net'
  - Ubuntu 18.04 image named 'bionic'

## Provision the cloud

1. Provide keystone URL and cloud admin password in terraform.tfvars file:

```
cloud_admin_password = "<cloud-admin-password>"
auth_url = "http://keystone.example:5000/v3"
```

2. Run terraform provisioning:

```
terraform init
terraform plan
terraform apply
```

## Destroy configuration

To destroy configuration, run `terraform destroy` in a reverse order.

# Infrastructure Overview

Cloud Admin:

  - Creates provider network (currently outside of the scope),
  - Creates new domain and its Domain Admin  -- a user with 'Admin' role for the domain,
  - Creates a project for administrative purposes in the new domain,
  - Assigns an 'Admin' role to the Domain Admin user for this project.

Domain Admin:

  - Creates a project for running general workloads,
  - Creates Project Admin and Project Member users, assigned to the project.

Project Admin:

  - Creates external router attached to the external network,
  - Creates private flavours.

Project Member:

  - Creates networks, routers, Floating IPs,
  - Creates images, volumes,
  - Creates instances, assigns Floating IPs to instances,
  - Creates DNS zone and records,
  - Creates containers and objects.

## Domains, projects, users

As a result, the following users and projects are created:

  - Domain Admin:
    - Domain: test-domain,
    - Project: test-admin-project,
    - Username: domain-admin,
    - Password: domain-admin,

  - Project Admin:
    - Domain: test-domain,
    - Project: test-workload-project,
    - Username: project-admin,
    - Password: project-admin,

  - Project Member:
    - Domain: test-domain,
    - Project: test-workload-project,
    - Username: project-member,
    - Password: project-member.