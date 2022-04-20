resource "aws_kms_key" "tf_cmk" {
  description         = "CMK for encrypting Terraform state"
  enable_key_rotation = true
}