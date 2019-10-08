resource "openstack_blockstorage_volume_v2" "volume_1" {
  name = "volume-1"
  size = 1
}

resource "openstack_blockstorage_volume_v2" "volume_from_cirros_image" {
  name     = "volume-from-cirros-image"
  size     = 5
  image_id = "${var.cirros_image_id}"
}

resource "openstack_blockstorage_volume_v2" "volume_2" {
  name = "volume-2"
  size = 1
}