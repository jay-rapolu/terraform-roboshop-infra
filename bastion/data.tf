data "aws_ami" "RHEL9_devops_practice" {
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ssm_parameter" "sg_id" {
  name = "/${var.project}/${var.environment}/bastion"
}

data "aws_ssm_parameter" "subnet_id" {
  name = "/${var.project}/${var.environment}/public_id"
}