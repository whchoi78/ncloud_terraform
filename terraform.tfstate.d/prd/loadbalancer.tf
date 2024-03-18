resource "ncloud_lb" "Application_Load_Balancer" {
  depends_on = [ ncloud_subnet.lb-subnet-pub ]
  name = var.web_lb
  network_type = "PUBLIC"
  type = "APPLICATION"
  subnet_no_list = [ ncloud_subnet.lb-subnet-pub.id ]
}

resource "ncloud_lb_target_group" "target_group_web" {
  name = var.web_tg
  vpc_no = ncloud_vpc.prd-ncloud_vpc.id
  target_type = "VSVR"
  protocol = "HTTP"
  health_check {
    cycle = 60
    protocol = "HTTP"
    port = 80
    http_method = "GET"
  }
  algorithm_type = "SIPHS"
}

resource "ncloud_lb_target_group_attachment" "web_target_group" {
  depends_on = [ ncloud_server.prd-web-01, ncloud_server.prd-web-02 ]
  target_group_no = ncloud_lb_target_group.target_group_web.target_group_no
  target_no_list = [ ncloud_server.prd-web-01.instance_no, ncloud_server.prd-web-02.instance_no ]
}

resource "ncloud_lb_listener" "web_lb_listener" {
  load_balancer_no = ncloud_lb.Application_Load_Balancer.id
  protocol = "HTTP"
  port = 80
  target_group_no = ncloud_lb_target_group.target_group_web.target_group_no
}

resource "ncloud_lb" "Network_Load_Balancer" {
  depends_on = [ ncloud_subnet.lb-subnet-pri ]
  name = var.was_lb
  network_type = "PRIVATE"
  type = "NETWORK"
  subnet_no_list = [ ncloud_subnet.lb-subnet-pri.id ]
}

resource "ncloud_lb_target_group" "target_group_was" {
  name = var.web_tg
  vpc_no = ncloud_vpc.prd-ncloud_vpc.id
  target_type = "VSVR"
  protocol = "TCP"
  port = 8009
    health_check {
    cycle = 60
    protocol = "TCP"
    port = 8009
  }
  algorithm_type = "RR"
}

resource "ncloud_lb_target_group_attachment" "was_target_group" {
  depends_on = [ ncloud_server.prd-was-01, ncloud_server.prd-was-02 ]
  target_group_no = ncloud_lb_target_group.target_group_was.target_group_no
  target_no_list = [ ncloud_server.prd-was-01.instance_no, ncloud_server.prd-was-02.instance_no ]
}

resource "ncloud_lb_listener" "was_lb_listener" {
  load_balancer_no = ncloud_lb.Network_Load_Balancer.id
  protocol = "TCP"
  port = 8009
  target_group_no = ncloud_lb_target_group.target_group_was.target_group_no
}
