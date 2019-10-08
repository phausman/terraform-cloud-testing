output "cirros_image_id" {
    value = "${openstack_images_image_v2.cirros.id}"
}

output "bionic_image_id" {
    value = "${data.openstack_images_image_v2.bionic.id}"
}
