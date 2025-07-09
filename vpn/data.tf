
data "aws_ssm_parameter" "sg_id" {
  name = "/${var.project}/${var.environment}/vpn"
}

data "aws_ssm_parameter" "subnet_id" {
  name = "/${var.project}/${var.environment}/public_id"
}