variable "ncloud_access_key" { 
  description = "The access key for ncloud"
  type = string
}

variable "ncloud_secret_key" { 
  description = "The secret key for ncloud"
  type = string
}

variable "region" {
  default = "KR"
}

variable "site" {
  default = "pub"
}

variable "support_vpc" {
  default = "true"
}

variable "vpc_name" {
  default = "dev-vpc"
}

variable "ipv4_cidr_block" {
  default = "172.20.0.0/16"
}

variable "default_nacl_name" {
  default = "dev-nacl"
}

variable "web_subnet_1_CIDR" {
  default = "172.20.0.0/24"
}

variable "web_subnet_1_name" {
  default = "dev-web-subnet-01"
}

variable "was_subnet_1_CIDR" {
  default = "172.20.10.0/24"
}

variable "was_subnet_1_name" {
  default = "dev-was-subnet-01"
}

variable "db_subnet_1_CIDR" {
  default = "172.20.20.0/24"
}

variable "db_subnet_1_name" {
  default = "dev-db-subnet-01"
}

variable "nat_subnet_CIDR" {
  default = "172.20.40.0/24"
}

variable "nat_subnet_name" {
  default = "dev-nat-subnet"
}

variable "nat_gateway_name" {
  default = "dev-nat-gw"
}

variable "web_nic_1_name" {
  default = "web-nic-1"
}

variable "web_server_1_ip" {
  default = "172.20.0.10"
}

variable "was_nic_1_name" {
  default = "was-nic-1"
}

variable "was_server_1_ip" {
  default = "172.20.10.15"
}

variable "db_nic_1_name" {
  default = "db-nic-1"
}

variable "db_server_1_ip" {
  default = "172.20.20.20"
}