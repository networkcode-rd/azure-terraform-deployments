terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = ">2.0.0"
    }
  }
}

resource "local_file" "file1" {
  content  = var.file1_content
  filename = "${path.module}/${var.filename1}"
}

resource "local_file" "file2" {
  content  = var.file2_content
  filename = "${path.module}/${var.filename2}"
}
