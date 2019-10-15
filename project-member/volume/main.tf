variable "project_member_role_assignment" {}
variable "cirros_image_id" {}

output "volume_1_id" {
    value = "${openstack_blockstorage_volume_v2.volume_1.id}"
}

output "volume_from_cirros_image_id" {
    value = "${openstack_blockstorage_volume_v2.volume_from_cirros_image.id}"
}

output "volume_2_id" {
    value = "${openstack_blockstorage_volume_v2.volume_2.id}"
}