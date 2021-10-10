#Creates web zone Subnets
resource "aws_subnet" "web_subnets" {
  vpc_id            = var.aws_vpc_id
  availability_zone = "${element(data.aws_availability_zones.azs.names, count.index)}"
  cidr_block        = "${element(var.web_cidrs, count.index)}"
  count             = "${length(data.aws_availability_zones.azs.names)}"
  tags = merge(
    var.global_tags,
    {
      "Name" = "websubnet-${count.index + 1}"
    },
  )
}

#Creates the app zone subnets
resource "aws_subnet" "app_subnets" {
  vpc_id            = var.aws_vpc_id
  availability_zone = "${element(data.aws_availability_zones.azs.names, count.index)}"
  cidr_block        = "${element(var.app_cidrs, count.index)}"
  count             = "${length(data.aws_availability_zones.azs.names)}"

  tags = merge(
    var.global_tags,
    {
      "Name" = "appsubnet-${count.index + 1}"
    },
  )
}

#Creates DB zone Subnets
resource "aws_subnet" "db_subnets" {
  vpc_id            = var.aws_vpc_id
  availability_zone = "${element(data.aws_availability_zones.azs.names, count.index)}"
  cidr_block        = "${element(var.db_cidrs, count.index)}"
  count             = "${length(data.aws_availability_zones.azs.names)}"
  tags = merge(
    var.global_tags,
    {
      "Name" = "dbsubnet-${count.index + 1}"
    },
  )
}





