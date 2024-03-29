resource "ncloud_vpc" "prd-ncloud_vpc" {
  name = var.vpc_name
  ipv4_cidr_block = var.ipv4_cidr_block
}

resource "ncloud_network_acl" "prd-nacl" {
  vpc_no = ncloud_vpc.prd-ncloud_vpc.id
  name = var.default_nacl_name
  description = var.description
}

resource "ncloud_network_acl_rule" "prd-nacl-rule" {
  network_acl_no = ncloud_network_acl.prd-nacl.id

  inbound {
    priority    = 100
    protocol    = "TCP"
    rule_action = "ALLOW"
    ip_block    = "0.0.0.0/0"
    port_range  = "1-65535"
  }
  inbound {
    priority    = 110
    protocol    = "UDP"
    rule_action = "ALLOW"
    ip_block    = "0.0.0.0/0"
    port_range  = "1-65535"
  }
  outbound {
    priority    = 100
    protocol    = "TCP"
    rule_action = "ALLOW"
    ip_block    = "0.0.0.0/0"
    port_range  = "1-65535"
  }
  outbound {
    priority    = 110
    protocol    = "UDP"
    rule_action = "ALLOW"
    ip_block    = "0.0.0.0/0"
    port_range  = "1-65535"
  }  
}

resource "ncloud_subnet" "web-subnet-1" {
  vpc_no = ncloud_vpc.prd-ncloud_vpc.id
  subnet = var.web_subnet_1_CIDR
  network_acl_no = ncloud_network_acl.prd-nacl.id
  zone = "KR-1"
  subnet_type = "PUBLIC"
  name = var.web_subnet_1_name
  usage_type = "GEN"
}

resource "ncloud_subnet" "web-subnet-2" {
  vpc_no = ncloud_vpc.prd-ncloud_vpc.id
  subnet = var.web_subnet_2_CIDR
  network_acl_no = ncloud_network_acl.prd-nacl.id
  zone = "KR-2"
  subnet_type = "PUBLIC"
  name = var.web_subnet_2_name
  usage_type = "GEN"
}

resource "ncloud_subnet" "was-subnet-1" {
  vpc_no = ncloud_vpc.prd-ncloud_vpc.id
  subnet = var.was_subnet_1_CIDR
  network_acl_no = ncloud_network_acl.prd-nacl.id
  zone = "KR-1"
  subnet_type = "PRIVATE"
  name = var.was_subnet_1_name
  usage_type = "GEN"
}

resource "ncloud_subnet" "was-subnet-2" {
  vpc_no = ncloud_vpc.prd-ncloud_vpc.id
  subnet = var.was_subnet_2_CIDR
  network_acl_no = ncloud_network_acl.prd-nacl.id
  zone = "KR-2"
  subnet_type = "PRIVATE"
  name = var.was_subnet_2_name
  usage_type = "GEN"
}

resource "ncloud_subnet" "db-subnet-1" {
  vpc_no = ncloud_vpc.prd-ncloud_vpc.id
  subnet = var.db_subnet_1_CIDR
  network_acl_no = ncloud_network_acl.prd-nacl.id
  zone = "KR-1"
  subnet_type = "PRIVATE"
  name = var.db_subnet_1_name
  usage_type = "GEN"
}

resource "ncloud_subnet" "db-subnet-2" {
  vpc_no = ncloud_vpc.prd-ncloud_vpc.id
  subnet = var.db_subnet_2_CIDR
  network_acl_no = ncloud_network_acl.prd-nacl.id
  zone = "KR-2"
  subnet_type = "PRIVATE"
  name = var.db_subnet_2_name
  usage_type = "GEN"
}

resource "ncloud_subnet" "lb-subnet-pub" {
  vpc_no = ncloud_vpc.prd-ncloud_vpc.id
  subnet = var.lb_subnet_pub_CIDR
  network_acl_no = ncloud_network_acl.prd-nacl.id
  zone = "KR-1"
  subnet_type = "PUBLIC"
  name = var.lb_subnet_pub_name
  usage_type = "LOADB"
}

resource "ncloud_subnet" "lb-subnet-pri" {
  vpc_no = ncloud_vpc.prd-ncloud_vpc.id
  subnet = var.lb_subnet_pri_CIDR
  network_acl_no = ncloud_network_acl.prd-nacl.id
  zone = "KR-1"
  subnet_type = "PRIVATE"
  name = var.lb_subnet_pri_name
  usage_type = "LOADB"
}

resource "ncloud_subnet" "nat-subnet" {
  vpc_no = ncloud_vpc.prd-ncloud_vpc.id
  subnet = var.nat_subnet_CIDR
  network_acl_no = ncloud_network_acl.prd-nacl.id
  zone = "KR-1"
  subnet_type = "PUBLIC"
  name = var.nat_gateway_name
  usage_type = "NATGW"
}

resource "ncloud_nat_gateway" "nat_gateway" {
  vpc_no = ncloud_vpc.prd-ncloud_vpc.id
  subnet_no = ncloud_subnet.nat-subnet.id
  zone = "KR-1"
  name = var.nat_gateway_name
  description = "prd_nat_gw"
}

resource "ncloud_route" "pri-route-rule" {
  route_table_no = data.ncloud_route_table.default_pri_route.id
  destination_cidr_block = "0.0.0.0/0"
  target_type = "NATGW"
  target_name = ncloud_nat_gateway.nat_gateway.name 
  target_no = ncloud_nat_gateway.nat_gateway.id
}