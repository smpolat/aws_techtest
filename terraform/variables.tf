# Defining CIDR Block for VPC
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
# Defining CIDR Block for Public 1st Subnet
variable "pubSubnet1_cidr" {
  default = "10.0.1.0/24"
}
# Defining CIDR Block for Public 2nd Subnet
variable "pubSubnet2_cidr" {
  default = "10.0.2.0/24"
}
# Defining CIDR Block for Private 1st Subnet
variable "priSubnet1_cidr" {
  default = "10.0.3.0/24"
}
# Defining CIDR Block for Private 2nd Subnet
variable "priSubnet2_cidr" {
  default = "10.0.4.0/24"
}
# Defining CIDR Block for Private 3rd Subnet
variable "priSubnet3_cidr" {
  default = "10.0.5.0/24"
}
# Defining CIDR Block for 4th Subnet
variable "priSubnet4_cidr" {
  default = "10.0.6.0/24"
}

variable "bucket_url" {}
variable "db_host" {}
variable "db_name" {}
variable "db_user" {}
variable "db_pass" {}
variable "auth_key" {}
variable "secure_auth_key" {}
variable "logged_in_key" {}
variable "nonce_key" {}
variable "auth_salt" {}
variable "secure_auth_salt" {}
variable "logged_in_salt" {}
variable "nonce_salt" {}
