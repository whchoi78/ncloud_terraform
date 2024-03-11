resource "ncloud_network_interface" "web-nic-1" {
  name = var.web_nic_1_name
  subnet_no = ncloud_subnet.web-subnet-1.id
  access_control_groups = [ncloud_access_control_group.web-acg.id, ncloud_access_control_group.common-acg.id]
  private_ip = var.web_server_1_ip
  description = "web-server-1 nic"
}

resource "ncloud_network_interface" "web-nic-2" {
  name = var.web_nic_2_name
  subnet_no = ncloud_subnet.web-subnet-2.id
  access_control_groups = [ncloud_access_control_group.web-acg.id, ncloud_access_control_group.common-acg.id]
  private_ip = var.web_server_2_ip
  description = "web-server-2 nic"
}

resource "ncloud_network_interface" "was-nic-1" {
  name = var.was_nic_1_name
  subnet_no = ncloud_subnet.was-subnet-1.id
  access_control_groups = [ncloud_access_control_group.was-acg.id, ncloud_access_control_group.common-acg.id]
  private_ip = var.was_server_1_ip
  description = "was-server-1 nic"
}

resource "ncloud_network_interface" "was-nic-2" {
  name = var.was_nic_2_name
  subnet_no = ncloud_subnet.was-subnet-2.id
  access_control_groups = [ncloud_access_control_group.was-acg.id, ncloud_access_control_group.common-acg.id]
  private_ip = var.was_server_2_ip
  description = "was-server-2 nic"
}

resource "ncloud_network_interface" "db-nic-1" {
  name = var.db_nic_1_name
  subnet_no = ncloud_subnet.db-subnet-1.id
  access_control_groups = [ncloud_access_control_group.db-acg.id, ncloud_access_control_group.common-acg.id]
  private_ip = var.db_server_1_ip
  description = "db-server-1 nic"
}

resource "ncloud_network_interface" "db-nic-2" {
  name = var.db_nic_2_name
  subnet_no = ncloud_subnet.db-subnet-2.id
  access_control_groups = [ncloud_access_control_group.db-acg.id, ncloud_access_control_group.common-acg.id]
  private_ip = var.db_server_2_ip
  description = "db-server-2 nic"
}