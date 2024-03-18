resource "ncloud_access_control_group" "web-acg" {
  name = var.web_acg_name
  vpc_no = ncloud_vpc.prd-ncloud_vpc.id
  description = var.description
}

resource "ncloud_access_control_group" "was-acg" {
  name = var.was_acg_name
  vpc_no = ncloud_vpc.prd-ncloud_vpc.id
  description = var.description
}

resource "ncloud_access_control_group" "db-acg" {
  name = var.db_acg_name
  vpc_no = ncloud_vpc.prd-ncloud_vpc.id
  description = var.description
}

resource "ncloud_access_control_group" "common-acg" {
  name = var.com_acg_name
  vpc_no = ncloud_vpc.prd-ncloud_vpc.id
  description = var.description
}

resource "ncloud_access_control_group_rule" "web-acg-rule" {
    access_control_group_no = ncloud_access_control_group.web-acg.id
  
  inbound {
    protocol = "TCP"
    ip_block = "172.21.30.0/24"
    port_range = "80"
    description = "web-lb -> web http"
  }

  outbound {
    protocol = "TCP"
    ip_block = "172.21.35.0/24"
    port_range = "8009"
    description = "web -> was-lb ajp"
  }
}

resource "ncloud_access_control_group_rule" "was-acg-rule" {
    access_control_group_no = ncloud_access_control_group.was-acg.id
  
  inbound {
    protocol = "TCP"
    ip_block = "172.21.35.0/24"
    port_range = "8009"
    description = "was-lb -> was ajp"
  }

  outbound {
    protocol = "TCP"
    ip_block = "172.21.20.0/24"
    port_range = "3306"
    description = "was -> db mysql"
  }
}

resource "ncloud_access_control_group_rule" "db-acg-rule" {
    access_control_group_no = ncloud_access_control_group.db-acg.id
  
  inbound {
    protocol = "TCP"
    ip_block = "172.21.20.0/24"
    port_range = "8009"
    description = "was-lb -> was ajp"
  }
}

resource "ncloud_access_control_group_rule" "common-acg-rule" {
    access_control_group_no = ncloud_access_control_group.common-acg.id
  
  inbound {
    protocol = "TCP"
    ip_block = "175.209.123.187/32"
    port_range = "22"
    description = "allow cloit ssh"
  }

  outbound {
    protocol = "TCP"
    source_access_control_group_no = ncloud_access_control_group.web-acg.id
    port_range = "22"
    description = "com -> web ssh"
  }

  outbound {
    protocol = "TCP"
    source_access_control_group_no = ncloud_access_control_group.was-acg.id
    port_range = "22"
    description = "com -> was ssh"
  }

  outbound {
    protocol = "TCP"
    source_access_control_group_no = ncloud_access_control_group.db-acg.id
    port_range = "22"
    description = "com -> db ssh"
  }
}