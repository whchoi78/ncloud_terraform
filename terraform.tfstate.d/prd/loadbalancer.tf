resource "ncloud_lb" "Application_Load_Balancer" {
  name = "prd-alb"
  network_type = "PUBLIC"
  type = "APPLICATION"
  subnet_no_list = [ ncloud_subnet.lb-subnet-pub ]
}

resource "ncloud_lb_target_group" "target_group_web" {
  vpc_no = ncloud_vpc.prd-ncloud_vpc
  protocol = "HTTP"
}