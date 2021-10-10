output "vpc_id" {
    value = length(aws_vpc.main) > 0 ? aws_vpc.main[0].id : ""
}

output "vpc_cidr" {
    value = length(aws_vpc.main) > 0 ? aws_vpc.main[0].cidr_block : ""
}