terraform {
    required_version = ">= 1.0"
}

provider "local" {}

# variable "file_content" {
#     type    = string
#     default = "Hello, World!"
# }

# variable "user_name" {
#     type    = string
#     default = "User"
# }

variable "file_upload_content_in_base64" {
    type    = string
    default = "This is a sample file upload content."
}

resource "local_file" "hello_world" {
    filename = "${path.module}/files/helloworld.txt"
    content  = base64decode(split(",", var.file_upload_content_in_base64)[1])
}

output "file_name_output" {
    description = "Displaying file name"
    value = local_file.hello_world.filename
}

output "file_output" {
    description = "Displaying file content"
    value = local_file.hello_world.content
}