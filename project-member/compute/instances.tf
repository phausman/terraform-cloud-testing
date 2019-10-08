#
# Basic instance
#

resource "openstack_compute_instance_v2" "basic_instance" {
  name            = "basic-instance"
  image_id        = "${var.cirros_image_id}"
  flavor_id       = "${data.openstack_compute_flavor_v2.m1-small.id}"
  key_pair        = "${openstack_compute_keypair_v2.test-keypair.name}"
  security_groups = ["default", "secgroup"]

  metadata = {
    this = "that"
  }

  network {
    uuid = "${var.tenant_network_id}"
  }
}

resource "openstack_compute_floatingip_associate_v2" "basic_instance_fip" {
  floating_ip = "${var.fip_2_address}"
  instance_id = "${openstack_compute_instance_v2.basic_instance.id}"
  fixed_ip    = "${openstack_compute_instance_v2.basic_instance.network.0.fixed_ip_v4}"
}


#
# Instance with volume attached
# 

resource "openstack_compute_instance_v2" "instance-with-attached-volume-v1" {
  name            = "instance-with-attached-volume-v1"
  image_id        = "${var.cirros_image_id}"
  flavor_id       = "${data.openstack_compute_flavor_v2.m1-small.id}"
  key_pair        = "${openstack_compute_keypair_v2.test-keypair.name}"
  security_groups = ["default", "secgroup"]

  network {
    uuid = "${var.tenant_network_id}"
  }
}

resource "openstack_compute_volume_attach_v2" "attached" {
  instance_id = "${openstack_compute_instance_v2.instance-with-attached-volume-v1.id}"
  volume_id   = "${var.volume_1_id}"
}


#
# Boot from volume
#

resource "openstack_compute_instance_v2" "boot-from-volume" {
  name            = "boot-from-volume"
  flavor_id       = "${data.openstack_compute_flavor_v2.m1-small.id}"
  key_pair        = "${openstack_compute_keypair_v2.test-keypair.name}"
  security_groups = ["default", "secgroup"]

  block_device {
    uuid                  = "${var.cirros_image_id}"
    source_type           = "image"
    volume_size           = 5
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }

  network {
    uuid = "${var.tenant_network_id}"
  }
}


#
# Boot from existing volume
#

resource "openstack_compute_instance_v2" "boot-from-existing-volume" {
  name            = "boot-from-existing-volume"
  flavor_id       = "${data.openstack_compute_flavor_v2.m1-small.id}"
  key_pair        = "${openstack_compute_keypair_v2.test-keypair.name}"
  security_groups = ["default", "secgroup"]

  block_device {
    uuid                  = "${var.volume_from_cirros_image_id}"
    source_type           = "volume"
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }

  network {
    uuid = "${var.tenant_network_id}"
  }
}


#
# Boot Instance, Create Volume, and Attach Volume as a Block Device
# 

resource "openstack_compute_instance_v2" "instance-with-attached-volume-v2" {
  name            = "instance-with-attached-volume-v2"
  image_id        = "${var.cirros_image_id}"
  flavor_id       = "${data.openstack_compute_flavor_v2.m1-small.id}"
  key_pair        = "${openstack_compute_keypair_v2.test-keypair.name}"
  security_groups = ["default", "secgroup"]

  block_device {
    uuid                  = "${var.cirros_image_id}"
    source_type           = "image"
    destination_type      = "local"
    boot_index            = 0
    delete_on_termination = true
  }

  block_device {
    source_type           = "blank"
    destination_type      = "volume"
    volume_size           = 1
    boot_index            = 1
    delete_on_termination = true
  }

  network {
    uuid = "${var.tenant_network_id}"
  }
}


#
#  Boot Instance and Attach Existing Volume as a Block Device
#

resource "openstack_compute_instance_v2" "instance-with-existing-volume" {
  name            = "instance-with-existing-volume"
  image_id        = "${var.cirros_image_id}"
  flavor_id       = "${data.openstack_compute_flavor_v2.m1-small.id}"
  key_pair        = "${openstack_compute_keypair_v2.test-keypair.name}"
  security_groups = ["default", "secgroup"]

  block_device {
    uuid                  = "${var.cirros_image_id}"
    source_type           = "image"
    destination_type      = "local"
    boot_index            = 0
    delete_on_termination = true
  }

  block_device {
    uuid                  = "${var.volume_2_id}"
    source_type           = "volume"
    destination_type      = "volume"
    boot_index            = 1
    delete_on_termination = true
  }

  network {
    uuid = "${var.tenant_network_id}"
  }
}


#
#  Instance With Multiple Networks
#

resource "openstack_compute_instance_v2" "instance-with-multiple-networks" {
  name            = "instance-with-multiple-networks"
  image_id        = "${var.bionic_image_id}"
  flavor_id       = "${data.openstack_compute_flavor_v2.m1-small.id}"
  key_pair        = "${openstack_compute_keypair_v2.test-keypair.name}"
  security_groups = ["default", "secgroup"]

  network {
    uuid = "${var.tenant_network_id}"
  }

  network {
    uuid = "${var.tenant_network_2_id}"
  }
}

resource "openstack_compute_floatingip_associate_v2" "myip" {
  floating_ip = "${var.fip_1_address}"
  instance_id = "${openstack_compute_instance_v2.instance-with-multiple-networks.id}"
  fixed_ip    = "${openstack_compute_instance_v2.instance-with-multiple-networks.network.0.fixed_ip_v4}"
}


#
#  Instance with Multiple Ephemeral Disks
#

resource "openstack_compute_instance_v2" "instance-with-multiple-ephemeral-disks" {
  name            = "instance-with-multiple-ephemeral-disks"
  image_id        = "${var.cirros_image_id}"
  flavor_id       = "${data.openstack_compute_flavor_v2.m1-medium.id}"
  key_pair        = "${openstack_compute_keypair_v2.test-keypair.name}"
  security_groups = ["default", "secgroup"]

  block_device {
    boot_index            = 0
    delete_on_termination = true
    destination_type      = "local"
    source_type           = "image"
    uuid                  = "${var.cirros_image_id}"
  }

  block_device {
    boot_index            = -1
    delete_on_termination = true
    destination_type      = "local"
    source_type           = "blank"
    volume_size           = 1
  }

  block_device {
    boot_index            = -1
    delete_on_termination = true
    destination_type      = "local"
    source_type           = "blank"
    volume_size           = 1
  }

  network {
    uuid = "${var.tenant_network_id}"
  }
}


#
#  Instance with User Data (cloud-init)
#

resource "openstack_compute_instance_v2" "instance-with-user-data" {
  name            = "instance-with-user-data"
  image_id        = "${var.bionic_image_id}"
  flavor_id       = "${data.openstack_compute_flavor_v2.m1-small.id}"
  key_pair        = "${openstack_compute_keypair_v2.test-keypair.name}"
  security_groups = ["default", "secgroup"]
  user_data       = "#cloud-config\npassword: ubuntu\nchpasswd: { expire: False }\nssh_pwauth: True"

  network {
    uuid = "${var.tenant_network_id}"
  }
}
