resource "ncloud_login_key" "loginkey" {
  key_name = "login"
}

resource "local_file" "ssh_key" {
  filename = "login.pem"
  content = ncloud_login_key.loginkey.private_key
}

resource "ncloud_server" "prd-web-01" {
  subnet_no = ncloud_subnet.web-subnet-1.id
  name = "prd-web-01"
  member_server_image_no = data.ncloud_member_server_image.member_server_base_image.id
  server_product_code = data.ncloud_server_product.stand_product.id
  login_key_name = ncloud_login_key.loginkey.key_name
  network_interface {
    network_interface_no = ncloud_network_interface.web-nic-1.id
    order = 0
  }
}

resource "ncloud_server" "prd-web-02" {
  subnet_no = ncloud_subnet.web-subnet-2.id
  name = "prd-web-02"
  member_server_image_no = data.ncloud_member_server_image.member_server_base_image.id
  server_product_code = data.ncloud_server_product.stand_product.id
  login_key_name = ncloud_login_key.loginkey.key_name
  network_interface {
    network_interface_no = ncloud_network_interface.web-nic-2.id
    order = 0
  }
}

resource "ncloud_public_ip" "prd-web-01-pub" {
  server_instance_no = ncloud_server.prd-web-01.id
  description = "prd-web-01-pub-ip"
}

output "prd-web-01-pub" {
  value = ncloud_public_ip.prd-web-01-pub.public_ip
}

resource "ncloud_public_ip" "prd-web-02-pub" {
  server_instance_no = ncloud_server.prd-web-02.id
  description = "prd-web-02-pub-ip"
}

output "prd-web-02-pub" {
  value = ncloud_public_ip.prd-web-02-pub.public_ip
}

resource "ncloud_server" "prd-was-01" {
  subnet_no = ncloud_subnet.was-subnet-1.id
  name = "prd-was-01"
  member_server_image_no = data.ncloud_member_server_image.member_server_base_image.id
  server_product_code = data.ncloud_server_product.stand_product.id
  login_key_name = ncloud_login_key.loginkey.key_name
  network_interface {
    network_interface_no = ncloud_network_interface.was-nic-1.id
    order = 0
  }
}

resource "ncloud_server" "prd-was-02" {
  subnet_no = ncloud_subnet.was-subnet-2.id
  name = "prd-was-02"
  member_server_image_no = data.ncloud_member_server_image.member_server_base_image.id
  server_product_code = data.ncloud_server_product.stand_product.id
  login_key_name = ncloud_login_key.loginkey.key_name
  network_interface {
    network_interface_no = ncloud_network_interface.was-nic-2.id
    order = 0
  }
}

resource "ncloud_server" "prd-db-01" {
  subnet_no = ncloud_subnet.db-subnet-1.id
  name = "prd-db-01"
  member_server_image_no = data.ncloud_member_server_image.member_server_base_image.id
  server_product_code = data.ncloud_server_product.stand_product.id
  login_key_name = ncloud_login_key.loginkey.key_name
  network_interface {
    network_interface_no = ncloud_network_interface.db-nic-1.id
    order = 0
  }
}

resource "ncloud_server" "prd-db-02" {
  subnet_no = ncloud_subnet.db-subnet-2.id
  name = "prd-db-02"
  member_server_image_no = data.ncloud_member_server_image.member_server_base_image.id
  server_product_code = data.ncloud_server_product.stand_product.id
  login_key_name = ncloud_login_key.loginkey.key_name
  network_interface {
    network_interface_no = ncloud_network_interface.db-nic-2.id
    order = 0
  }
}