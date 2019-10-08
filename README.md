# Introducation

Before creating the infrastructure, make sure the following resources
are already existing in the cloud:

  - external network named 'ext-net'
  - Ubuntu 18.04 image named 'bionic'

## Provision the cloud

Run infrastructure provisioning in this order:

1. cloud-admin
2. domain-admin
3. project-admin
4. project-member

For each step run:

```
terraform init
terraform plan
terraform apply
```

## Destroy configuration

To destroy configuration, run `terraform destroy` in a reverse order:

1. project-member
2. project-admin
3. domain-admin
4. cloud-admin

# Notes

Cloud Admin (CA) can create Domains and Domain Admins (DA) on them
DA can create and manage projects under that domain

DA can create and manage users on that domain
Project Admin (PA) can change quotas of project
PA can create flavours
PA can create availability zones

PA can manage members of the project
Project Member (PMem) can create networks in the project
PMem can create instances in the project
PMem can use volumes, etc

source: https://pedro.alvarezpiedehierro.com/2019/02/06/openstack-domain-project-admin/