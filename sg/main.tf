module "bastion" {
    source = "git::https://github.com/jay-rapolu/terraform-aws-sg-module.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = "bastion"
    sg_description = "This Security group is created for bastion"
    vpc_id = local.vpc_id
}

module "backend_alb" {
    source = "git::https://github.com/jay-rapolu/terraform-aws-sg-module.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = "backend_alb"
    sg_description = "This Security group is created for backend alb."
    vpc_id = local.vpc_id
}

module "vpn" {
    source = "git::https://github.com/jay-rapolu/terraform-aws-sg-module.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = "vpn"
    sg_description = "This Security group is created for vpn."
    vpc_id = local.vpc_id
}


resource "aws_vpc_security_group_ingress_rule" "bastion_ssh" {
  security_group_id = module.bastion.sg_id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

# This rule will allow the instances created in bastion sg id to load balancer
resource "aws_security_group_rule" "bastion_backend_alb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_id
  security_group_id = module.backend_alb.sg_id
}

#This rule will allow connections to backend alb from vpn on port 80
resource "aws_security_group_rule" "vpn_backend_alb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = module.vpn.sg_id
  security_group_id = module.backend_alb.sg_id
}

resource "aws_security_group_rule" "vpn_ports" {
  count             = length(var.vpn_ports)
  type              = "ingress"
  from_port         = var.vpn_ports[count.index]
  to_port           = var.vpn_ports[count.index]
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn.sg_id
}
