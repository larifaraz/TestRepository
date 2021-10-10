output "bucket_arn" {
    value = module.awss3.bucket_arn
}

output "bucket_id" {
    value = module.awss3.bucket_id
}

output "DDBTable_arn" {
    value = module.dynamodb.DDBTable_arn
}

output "vpc_id" {
    value = module.vpc.vpc_id
}
