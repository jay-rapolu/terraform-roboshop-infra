resource "aws_ssm_parameter" "bastion_sg_id" {
  name = "/${var.project}/${var.environment}/bastion"
  type = "String"
  value = module.bastion.sg_id
}