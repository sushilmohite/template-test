terraform {
    required_version = ">= 1.0"
}

provider "local" {}

resource "local_file" "hello_world" {
    filename = "${path.module}/files/helloworld.txt"
    content  = "Hello, World!"
}
