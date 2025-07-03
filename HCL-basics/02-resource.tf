resource "local_file" "networkcode" {
  content  = "The whole content for this Github project, is to publish my work on Terraform.\n by \n Networkcode" 
  filename = "${path.module}/networkcode.txt"
}


resource "local_sensitive_file" "networkcode_sense" {
  content  = "The whole content for this Github project, is to publish my work on Terraform.\n ~by \n Networkcode" 
  filename = "${path.module}/networkcodesense.txt"
}