# Cloud Admin password (admin user, in admin_domain)
cloud_admin_password = "<cloud-admin-password>"

# Keystone endpoint URL
auth_url = "http://keystone.example.com:5000/v3"

# Region
region = "RegionOne"

# Path to CA certificate file. Empty if not used.
cacert_file = ""

# This variable will be updated by local-exec provisioner in cloud-admin
# as soon as new domain is created
test_domain_id = ""

# MTU for internal networks
# My OrangeBox with Microtik switch needs this set to 1422.
# Normally, 1500 should be OK.
mtu = 1500
