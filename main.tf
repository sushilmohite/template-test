terraform {
    required_version = ">= 1.0"
}

provider "local" {}

variable "file_name" {
    type    = string
    default = "helloworld.txt"
}

variable "file_upload_content" {
    type        = string
    description = "Path to a file whose contents should be read. Example: /tmp/upload.txt"
    default     = ""
}

locals {
  file_exists  = var.file_upload_content != "" && fileexists(var.file_upload_content)
  file_content = local.file_exists ? file(var.file_upload_content) : ""
  file_base64  = local.file_exists ? filebase64(var.file_upload_content) : ""
}

resource "local_file" "hello_world" {
    filename = "${path.module}/files/${var.file_name}"
    content  = local.file_content
}

output "file_name_output" {
    description = "Displaying file name"
    value = local_file.hello_world.filename
}

output "file_output" {
    description = "Displaying file content read from the path provided in `file_upload_content`"
    value = local_file.hello_world.content
}

output "file_upload_path_exists" {
    description = "Whether the configured `file_upload_content` path exists"
    value       = local.file_exists
}

output "file_upload_content_base64" {
    description = "Base64 of the file contents (empty if path not found)"
    value       = local.file_base64
}
