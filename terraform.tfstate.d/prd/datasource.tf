data "ncloud_server_products" "products" {
  server_image_product_code = "SW.VSVR.OS.LNX64.UBNTU.SVR2004.B050"
  //server_image_product_code = "SW.VSVR.OS.LNX64.CNTOS.0703.B050" //  Search by 'CentOS 7.3 (64-bit)' image vpc
  // server_image_product_code = "SPSW0LINUX000032"  // Search by 'CentOS 7.3 (64-bit)' image classic
  //server_image_product_code = data.ncloud_member_server_images.member_server_base_images.id
  
  filter {
    name   = "product_code"
    values = ["SSD"]
    regex  = true
  }

  filter {
    name   = "cpu_count"
    values = ["2"]
  }

  filter {
    name   = "memory_size"
    values = ["4GB"]
  }

  filter {
    name   = "base_block_storage_size"
    values = ["50GB"]
  }

  filter {
    name   = "product_type"
    values = ["HICPU"]
  }

  output_file = "product.json"
}

output "products" {
  value = {
    for product in data.ncloud_server_products.products.server_products:
    product.id => product.product_name
  }
}

data "ncloud_regions" "regions" {
}

data "ncloud_server_images" "server_images" {
  
   output_file = "image.json"
}

data "ncloud_member_server_image" "member_server_base_image" { 
 no_list = [ "16875575" ]
}

data "ncloud_server_product" "stand_product" {
  server_image_product_code = "SW.VSVR.OS.LNX64.UBNTU.SVR2004.B050"
  //server_image_product_code = "SW.VSVR.OS.LNX64.CNTOS.0703.B050" //  Search by 'CentOS 7.3 (64-bit)' image vpc
  // server_image_product_code = "SPSW0LINUX000032"  // Search by 'CentOS 7.3 (64-bit)' image classic
  //server_image_product_code = data.ncloud_member_server_images.member_server_base_images.id
  
  filter {
    name   = "product_code"
    values = ["SSD"]
    regex  = true
  }

  filter {
    name   = "cpu_count"
    values = ["2"]
  }

  filter {
    name   = "memory_size"
    values = ["4GB"]
  }

  filter {
    name   = "base_block_storage_size"
    values = ["50GB"]
  }

  filter {
    name   = "product_type"
    values = ["HICPU"]
  }
}

data "ncloud_route_table" "default_pub_route" {
  vpc_no = ncloud_vpc.prd-ncloud_vpc.vpc_no
  supported_subnet_type = "PUBLIC"
    filter {
    name = "is_default"
    values = ["true"]
  }
}

data "ncloud_route_table" "default_pri_route" {
  vpc_no = ncloud_vpc.prd-ncloud_vpc.vpc_no
  supported_subnet_type = "PRIVATE"
  filter {
    name = "is_default"
    values = ["true"]
  }
}