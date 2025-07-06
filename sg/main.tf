module "bastion" {
    source = "git::https://github.com/jay-rapolu/terraform-aws-sg-module.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = "bastion"
    sg_description = "This Security group is created for frontend instances."
    vpc_id = local.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = module.bastion.sg_id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_ssh" {
  security_group_id = module.bastion.sg_id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}