resource "openstack_dns_recordset_v2" "rs_compute_example_com" {
    zone_id = "${openstack_dns_zone_v2.example_zone.id}"
    name = "rs.compute.example.com."
    description = "An example record set"
    ttl = 3000
    type = "A"
    records = ["10.0.0.1"]
    depends_on = [var.project_member_role_assignment]
}