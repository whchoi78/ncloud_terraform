resource "ncloud_login_key" "loginkey" {
  key_name = "login"
}

resource "local_file" "ssh_key" {
  filename = "login.pem"
  content = ncloud_login_key.loginkey.private_key
}

resource "ncloud_server" "dev-web-01" {
  subnet_no = ncloud_subnet.web-subnet-1.id
  name = var.web_server_1
  member_server_image_no = data.ncloud_member_server_image.member_server_base_image.id
  server_product_code = data.ncloud_server_product.stand_product.id
  login_key_name = ncloud_login_key.loginkey.key_name
  network_interface {
    network_interface_no = ncloud_network_interface.web-nic-1.id
    order = 0
  }
  description = var.description
}

resource "ncloud_public_ip" "dev-web-01-pub" {
  server_instance_no = ncloud_server.dev-web-01.id
  description = var.description
}

output "dev-web-01-pub" {
  value = ncloud_public_ip.dev-web-01-pub.public_ip
}

resource "ncloud_server" "dev-was-01" {
  subnet_no = ncloud_subnet.was-subnet-1.id
  name = var.was_server_1
  member_server_image_no = data.ncloud_member_server_image.member_server_base_image.id
  server_product_code = data.ncloud_server_product.stand_product.id
  login_key_name = ncloud_login_key.loginkey.key_name
  network_interface {
    network_interface_no = ncloud_network_interface.was-nic-1.id
    order = 0
  }
  description = var.description
}

resource "ncloud_server" "dev-db-01" {
  subnet_no = ncloud_subnet.db-subnet-1.id
  name = var.db_server_1
  member_server_image_no = data.ncloud_member_server_image.member_server_base_image.id
  server_product_code = data.ncloud_server_product.stand_product.id
  login_key_name = ncloud_login_key.loginkey.key_name
  network_interface {
    network_interface_no = ncloud_network_interface.db-nic-1.id
    order = 0
  }
  description = var.description
}
