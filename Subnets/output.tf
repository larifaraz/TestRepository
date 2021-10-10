output "web_subnets" {
  value = "${aws_subnet.web_subnets.*.id}"
}
output "app_subnets" {
  value = "${aws_subnet.app_subnets.*.id}"
}
output "db_subnets" {
  value = "${aws_subnet.db_subnets.*.id}"
}

output "subnet_ips" {
  value = "${aws_subnet.web-subnets.*.cidr_block}"
}