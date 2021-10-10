resource "aws_vpc" "main" {
  count              = var.provision_vpc == true ? 1 : 0 
  cidr_block         = "${var.vpc_cidr_base}${var.vpc_end_cidr}"
  instance_tenancy   = "default"
  enable_dns_support = var.enable_dns_support
  tags = merge(
      var.global_tags,
      {
          Name = "PROD-VPC"
      },
  )
}

# Define Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id   = var.aws_vpc_id
  tags = merge(
      var.global_tags,
      {
          Name = "IGW"
      },
  )
}

# Define Elastic IP for NAT 

resource "aws_eip" "nateip" {
  vpc      = true
}

# Define NAT Gateway

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nateip.id
  subnet_id     = "${aws_subnet.web-subnets.*.id[0]}"
  depends_on    = ["aws_internet_gateway.igw"]

  tags = merge(
      var.global_tags,
      {
          Name = "NGW"
      },
  )
}

# Define public route table

resource "aws_route_table" "public-subnet-rt" {
  vpc_id = var.aws_vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = merge(
      var.global_tags,
      {
          Name = "Public Subnet Route"
      },
  )
}

# Define Private route table

resource "aws_route_table" "private-subnet-rt" {
  vpc_id   = var.aws_vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.ngw.id}"
  }

  tags = merge(
      var.global_tags,
      {
          Name = "Private Subnet Route"
      },
  )
}

resource "aws_default_route_table" "private-subnet-rt" {
  default_route_table_id = "${aws_vpc.main.default_route_table_id}"

  tags = {
    Name = "default route"
  }
}

# Associating route table to public subnet

resource "aws_route_table_association" "public_assoc" {
  count          = 2
  subnet_id      = "${aws_subnet.web-subnets.*.id[count.index]}"
  route_table_id = "${aws_route_table.public-subnet-rt.id}"
}

# Associating route table to private subnet

resource "aws_route_table_association" "private_assoc" {
  count          = "${length(data.aws_availability_zones.azs.names)}"
  subnet_id      = "${aws_subnet.app-subnets.*.id[count.index]}"
  route_table_id = "${aws_route_table.private-subnet-rt.id}"
}

resource "aws_route_table_association" "private_assoc_db" {
  count          = "${length(data.aws_availability_zones.azs.names)}"
  subnet_id      = "${aws_subnet.db-subnets.*.id[count.index]}"
  route_table_id = "${aws_route_table.private-subnet-rt.id}"
}
