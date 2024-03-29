#
# Example with simple content 
#

resource "openstack_objectstorage_object_v1" "doc_1" {
    container_name = "${openstack_objectstorage_container_v1.container_1.name}"
    name           = "test/content-provided-inline.json"
    content_type   = "application/json"
    content        = <<JSON
                {
                  "foo" : "bar"
                }
JSON
    depends_on     = [var.project_member_role_assignment]
}


#
# Example with content from file 
#

resource "openstack_objectstorage_object_v1" "doc_2" {
    container_name = "${openstack_objectstorage_container_v1.container_1.name}"
    name           = "test/content-provided-from-file.json"
    content_type   = "application/json"
    source         = "./project-member/object/example.json"
    depends_on     = [var.project_member_role_assignment]
}