locals{
    common_tags = {
        project = var.project
        environment = var.environment
        terraform = true
    }
    ami_id = data.aws_ami.RHEL9_devops_practice.id
}