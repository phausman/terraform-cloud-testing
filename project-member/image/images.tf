# Cirros image
resource "openstack_images_image_v2" "cirros" {
  name             = "cirros"
  image_source_url = "http://download.cirros-cloud.net/0.4.0/cirros-0.4.0-x86_64-disk.img"
  container_format = "bare"
  disk_format      = "qcow2"
}

# Get bionic image already exising in the cloud
data "openstack_images_image_v2" "bionic" {
  name        = "bionic"
  most_recent = true
}