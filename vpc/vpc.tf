module "vpc"{
    source = "git::https://github.com/jay-rapolu/terraform-vpc-module.git?ref=main"
    project = var.project
    environment = var.environment
    cidr_block = "10.0.0.0/16"
    public_cidrs = ["10.0.0.0/24", "10.0.1.0/24"]
    private_cidrs = ["10.0.10.0/24", "10.0.11.0/24"]
    database_cidrs = ["10.0.20.0/24", "10.0.21.0/24"]
    is_peering_required = false
}

output "default_route"{
    value = module.vpc.route_table
}

output "vpc_id" {
    value = module.vpc.vpc_id
}

output "public_subnets"{
    value = module.vpc.public_subnets
}



