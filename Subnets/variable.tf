variable "web_cidrs" {
  type = "list"
}

variable "app_cidrs" {
  type = "list"
}

variable "db_cidrs" {
  type = "list"
}

variable "global_tags" {}

data "aws_availability_zones" "azs" {}