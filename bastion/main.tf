resource "aws_instance" "bastion" {
  ami                    = local.ami_id 
  instance_type          = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.sg_id.value]
  subnet_id = split(",", data.aws_ssm_parameter.subnet_id.value)[0]
  tags = merge(
    local.common_tags,
    {
    Name = "${var.project}-${var.environment}-bastion"
  })
}