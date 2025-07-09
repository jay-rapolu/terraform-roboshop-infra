resource "aws_instance" "vpn" {
  ami                    = "ami-02612c926201def10"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.sg_id.value]
  subnet_id = split(",", data.aws_ssm_parameter.subnet_id.value)[0]
  key_name = "linux-aws"
  user_data = file("openvpn.sh")
  tags = merge(
    local.common_tags,
    {
    Name = "${var.project}-${var.environment}-vpn"
  })
}

resource "aws_route53_record" "vpn" {
  zone_id = var.zone_id
  name    = "vpn-${var.environment}.${var.zone_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.vpn.public_ip]
  allow_overwrite = true
}