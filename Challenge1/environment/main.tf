provider "aws" {
    region = local.aws_region
}

module "awss3" {
    source              = "../awsS3"
    bucket_name         = local.bucket_name
    global_tags         = local.global_tags
}

module "dynamodb" {
    source              = "../dynamodb"
    dynamodbtable_name  = local.dynamodbtable_name  
    global_tags         = local.global_tags
}

module "vpc" {
    source              = "../vpc"
    vpc_cidr_base       = local.vpc_cidr_base
    vpc_end_cidr        = local.vpc_end_cidr
    enable_dns_support  = local.enable_dns_support
    global_tags         = local.global_tags
    provision_vpc       = local.provision_vpc
} 
 
module "Subnets" { 
    source = "../Subnets" 
    web_cidrs           = local.web_cidrs
    app_cidrs           = local.app_cidrs
    db_cidrs            = local.db_cidrs
    global_tags         = local.global_tags
}
