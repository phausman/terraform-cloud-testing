# Introduction

Before creating the infrastructure, make sure the following resources
are already existing in the cloud:

  - External network named 'ext-net',
  - Ubuntu 18.04 image named 'bionic'.

## Provision the cloud

Configure cloud specific variables in `config.tfvars`.

Run infrastructure provisioning in this order:

1. cloud-admin
2. domain-admin
3. project-admin
4. project-member

For each step run:

```
terraform init
terraform plan -var-file ../config.tfvars
terraform apply -var-file ../config.tfvars
```

## Destroy configuration

To destroy configuration, run `terraform destroy -var-file ../config.tfvars` in a reverse order: 

1. project-member
2. project-admin
3. domain-admin
4. cloud-admin

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
