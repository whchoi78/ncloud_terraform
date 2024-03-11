resource "ncloud_access_control_group" "web-acg" {
  name = "web-dev-acg"
  vpc_no = ncloud_vpc.dev-ncloud_vpc.id
  description = "web access control group"
}

resource "ncloud_access_control_group" "was-acg" {
  name = "was-dev-acg"
  vpc_no = ncloud_vpc.dev-ncloud_vpc.id
  description = "was access control group"
}

resource "ncloud_access_control_group" "db-acg" {
  name = "db-dev-acg"
  vpc_no = ncloud_vpc.dev-ncloud_vpc.id
  description = "DB access control group"
}

resource "ncloud_access_control_group" "common-acg" {
  name = "common-dev-acg"
  vpc_no = ncloud_vpc.dev-ncloud_vpc.id
  description = "common access control group"
}

resource "ncloud_access_control_group_rule" "web-acg-rule" {
    access_control_group_no = ncloud_access_control_group.web-acg.id
  
  inbound {
    protocol = "TCP"
    ip_block = "0.0.0.0/0"
    port_range = "80"
    description = "0.0.0.0/0 -> web http"
  }

  outbound {
    protocol = "TCP"
    source_access_control_group_no = ncloud_access_control_group.was-acg.id
    port_range = "8009"
    description = "web -> was ajp"
  }
}

resource "ncloud_access_control_group_rule" "was-acg-rule" {
    access_control_group_no = ncloud_access_control_group.was-acg.id
  
  inbound {
    protocol = "TCP"
    source_access_control_group_no = ncloud_access_control_group.web-acg.id
    port_range = "8009"
    description = "web -> was ajp"
  }

  outbound {
    protocol = "TCP"
    source_access_control_group_no = ncloud_access_control_group.db-acg.id
    port_range = "3306"
    description = "was -> db mysql"
  }
}

resource "ncloud_access_control_group_rule" "db-acg-rule" {
    access_control_group_no = ncloud_access_control_group.db-acg.id
  
  inbound {
    protocol = "TCP"
    source_access_control_group_no = ncloud_access_control_group.was-acg.id
    port_range = "3306"
    description = "was -> db mysql"
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

  inbound {
    protocol = "TCP"
    source_access_control_group_no = ncloud_access_control_group.common-acg.id
    port_range = "22"
    description = "ssh"
  }

  outbound {
    protocol = "TCP"
    source_access_control_group_no = ncloud_access_control_group.common-acg.id
    port_range = "22"
    description = "ssh"
  }
}