locals {
    aws_region         = "ap-south-1" 
    provision_vpc      = true
    vpc_cidr_base      = "192.168"
    vpc_end_cidr       = ".0.0/16"
    enable_dns_support = false
    bucket_prefix      = "mytestterraform"
    bucket_name        = ["${local.bucket_prefix}-bucket", "${local.bucket_prefix}-bucket2", "${local.bucket_prefix}-bucket3"]
    dynamodbtable_name = "GameScores"
    resource_prefix    = "new"
    environment        = "PROD"
    az_count           = "3"
    global_tags        = {
        "CreatedBy"    = "Faraz"
        "CreatedOn"    = "14th-April"
        "Stack"        = "${local.resource_prefix}-stack"
        "Managed By"   = "terraform"
    } 

    web_cidrs          = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
    app_cidrs          = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
    db_cidrs           = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
}