resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project}/${var.environment}/vpc_id"
  type  = "String"
  value = module.vpc.vpc_id
  tags = merge(
    local.common_variables)
}

resource "aws_ssm_parameter" "public_subnets" {
  name  = "/${var.project}/${var.environment}/public_id"
  type  = "StringList"
  value = join("," ,module.vpc.public_subnets)
  tags = merge(
    local.common_variables)
}

resource "aws_ssm_parameter" "private_subnets" {
  name  = "/${var.project}/${var.environment}/private_id"
  type  = "StringList"
  value = join("," ,module.vpc.public_subnets)
  tags = merge(
    local.common_variables)
}