locals{
    common_tags = {
        project = var.project
        environment = var.environment
        terraform = true
    }
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    private_ids = split("," ,data.aws_ssm_parameter.private_subnets.value)
    backend_alb_sg_id = data.aws_ssm_parameter.backend_alb_sg_id
}