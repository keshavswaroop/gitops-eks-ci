resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "private_subnet" {

  count = length(var.private_subnet_cidr)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet_cidr[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "${var.vpc_name}-private-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnet_cidr)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet_cidr[count.index]
  availability_zone = var.availability_zones[count.index]
  
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-public-subnet-${count.index + 1}"
  }
}

resource "aws_eip" "elastic_ip" {
#   instance = aws_instance.web.id
  count = length(var.public_subnet_cidr)
  domain   = "vpc"

  tags = {
    Name="${var.vpc_name}-eip-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.vpc_name}-internet-gateway"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  count = length(var.public_subnet_cidr)
  allocation_id = aws_eip.elastic_ip[count.index].id
  subnet_id     = aws_subnet.public_subnet[count.index].id

  tags = {
    Name = "${var.vpc_name}-nat-gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.internet_gateway]
}


resource "aws_route_table" "private_route_table" {
  count = length(var.private_subnet_cidr)
  vpc_id = aws_vpc.vpc.id

  route {
    # cidr_block = "10.0.1.0/24"
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway[count.index].id
  }


  tags = {
    Name = "${var.vpc_name}-private-route-table-${count.index + 1}"
  }
}

resource "aws_route_table_association" "private_subnet_route_association" {
  count = length(var.private_subnet_cidr)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_route_table[count.index].id
}


resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    # cidr_block = "10.0.1.0/24"
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }


  tags = {
    Name = "${var.vpc_name}-public-route-table"
  }
}

resource "aws_route_table_association" "public_subnet_route_association" {
  count = length(var.public_subnet_cidr)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}