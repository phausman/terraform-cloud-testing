resource "openstack_objectstorage_container_v1" "container_1" {
    name   = "tf-test-container-1"

    metadata = {
      test = "true"
    }

    content_type = "application/json"
    container_read = ".r:*,.rlistings"
    depends_on = [var.project_member_role_assignment]
}