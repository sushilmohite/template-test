terraform {
    required_version = ">= 1.0"
}

provider "local" {}

variable "file_content" {
    type    = string
    default = "Hello, World!"
}

variable "user_name" {
    type    = string
    default = "User"
}

resource "local_file" "hello_world" {
    filename = "${path.module}/files/helloworld.txt"
    content  = "${var.file_content} ${var.user_name}"
}

output "file_name_output" {
    description = "Displaying file name"
    value = local_file.hello_world.filename
}

output "file_output" {
    description = "Displaying file content"
    value = local_file.hello_world.content
}