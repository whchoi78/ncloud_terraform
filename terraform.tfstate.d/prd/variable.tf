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

variable "description" {
  default = "created by terraform"
}

variable "vpc_name" {
  default = "prd-vpc"
}

variable "ipv4_cidr_block" {
  default = "172.21.0.0/16"
}

variable "default_nacl_name" {
  default = "prd-nacl"
}

variable "web_subnet_1_CIDR" {
  default = "172.21.0.0/24"
}

variable "web_subnet_1_name" {
  default = "prd-web-subnet-01"
}

variable "web_subnet_2_CIDR" {
  default = "172.21.5.0/24"
}

variable "web_subnet_2_name" {
  default = "prd-web-subnet-02"
}

variable "was_subnet_1_CIDR" {
  default = "172.21.10.0/24"
}

variable "was_subnet_1_name" {
  default = "prd-was-subnet-01"
}

variable "was_subnet_2_CIDR" {
  default = "172.21.15.0/24"
}

variable "was_subnet_2_name" {
  default = "prd-was-subnet-02"
}

variable "db_subnet_1_CIDR" {
  default = "172.21.20.0/24"
}

variable "db_subnet_1_name" {
  default = "prd-db-subnet-01"
}

variable "db_subnet_2_CIDR" {
  default = "172.21.25.0/24"
}

variable "db_subnet_2_name" {
  default = "prd-db-subnet-02"
}

variable "lb_subnet_pub_CIDR" {
  default = "172.21.30.0/24"
}

variable "lb_subnet_pub_name" {
  default = "prd-lb-subnet-pub"
}

variable "lb_subnet_pri_CIDR" {
  default = "172.21.35.0/24"
}

variable "lb_subnet_pri_name" {
  default = "prd-lb-subnet-pri"
}

variable "nat_subnet_CIDR" {
  default = "172.21.40.0/24"
}

variable "nat_subnet_name" {
  default = "prd-nat-subnet"
}

variable "nat_gateway_name" {
  default = "prd-nat-gw"
}

variable "web_acg_name" {
  default = "prd-web-acg"
}

variable "was_acg_name" {
  default = "prd-was-acg"
}

variable "db_acg_name" {
  default = "prd-db-acg"
}

variable "com_acg_name" {
  default = "com-db-acg"
}

variable "web_nic_1_name" {
  default = "prd-web-nic-1"
}

variable "web_server_1_ip" {
  default = "172.21.0.10"
}

variable "web_nic_2_name" {
  default = "prd-web-nic-2"
}

variable "web_server_2_ip" {
  default = "172.21.5.10"
}

variable "was_nic_1_name" {
  default = "prd-was-nic-1"
}

variable "was_server_1_ip" {
  default = "172.21.10.15"
}

variable "was_nic_2_name" {
  default = "prd-was-nic-2"
}

variable "was_server_2_ip" {
  default = "172.21.15.15"
}

variable "db_nic_1_name" {
  default = "db-nic-1"
}

variable "db_server_1_ip" {
  default = "172.21.20.20"
}

variable "db_nic_2_name" {
  default = "db-nic-2"
}

variable "db_server_2_ip" {
  default = "172.21.25.25"
}

variable "web_01_name" {
  default = "prd-web-01"
}

variable "web_02_name" {
  default = "prd-web-02"
}

variable "was_01_name" {
  default = "prd-was-01"
}

variable "was_02_name" {
  default = "prd-was-02"
}

variable "db_01_name" {
  default = "prd-db-01"
}

variable "db_02_name" {
  default = "prd-db-02"
}

variable "web_lb" {
  default = "prd-web-lb"
}

variable "web_tg" {
  default = "prd-web-tg"
}

variable "was_lb" {
  default = "prd-was-lb"
}

variable "was_tg" {
  default = "prd-was-tg"
}
