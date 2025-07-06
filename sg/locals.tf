locals{
    common_tags = {
        project = var.project
        environment = var.environment
        terraform = true
    }
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    
}