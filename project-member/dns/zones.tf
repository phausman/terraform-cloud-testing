resource "openstack_dns_zone_v2" "example_zone" {
    name = "compute.example.com."
    email = "email2@example.com"
    description = "a zone"
    ttl = 6000
    type = "PRIMARY"
    depends_on = [var.project_member_role_assignment]
}