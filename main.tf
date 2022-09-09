# CONFIGURE AWS PROVIDER
provider "aws" {
  region = var.region-name
}

# CREATE VPC
resource "aws_vpc" "Assignment-VPC" {
  cidr_block       = var.cidr-for-vpc
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "Assignment-VPC"
  }
}

# PUBLIC SUBNET
resource "aws_subnet" "Public-sub-1" {
  vpc_id     = aws_vpc.Assignment-VPC.id
  cidr_block = var.cidr-for-pub-1
  availability_zone = var.Pub-1-AZ

  tags = {
    Name = "Public-sub-1"
  }
}

resource "aws_subnet" "Public-sub-2" {
  vpc_id     = aws_vpc.Assignment-VPC.id
  cidr_block = var.cidr-for-pub-2
  availability_zone = var.Pub-2-AZ

  tags = {
    Name = "Public-sub-2"
  }
}

# PRIVATE SUBNETS
resource "aws_subnet" "Private-sub-1" {
  vpc_id     = aws_vpc.Assignment-VPC.id
  cidr_block = var.cidr-for-priv-1
  availability_zone = var.Priv-1-AZ

  tags = {
    Name = "Private-sub-1"
  }
}

resource "aws_subnet" "Private-sub-2" {
  vpc_id     = aws_vpc.Assignment-VPC.id
  cidr_block = var.cidr-for-priv-2
  availability_zone = var.Priv-2-AZ

  tags = {
    Name = "Private-sub-2"
  }
}

# Public Route Table
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.Assignment-VPC.id

  tags = {
    Name = "public-route-table"
  }
}

# Private Route Table
resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.Assignment-VPC.id

  tags = {
    Name = "private-route-table"
  }
}

# Public Route Table Association
resource "aws_route_table_association" "public-route-table-association-1" {
  subnet_id      = aws_subnet.Public-sub-1.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "public-route-table-association-2" {
  subnet_id      = aws_subnet.Public-sub-2.id
  route_table_id = aws_route_table.public-route-table.id
}

# Private Route Table Assocation
resource "aws_route_table_association" "private-route-table-association-1" {
  subnet_id      = aws_subnet.Private-sub-1.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-route-table-association-2" {
  subnet_id      = aws_subnet.Private-sub-2.id
  route_table_id = aws_route_table.private-route-table.id
}

#Internet Gateway
resource "aws_internet_gateway" "Assignment-IGW" {
  vpc_id = aws_vpc.Assignment-VPC.id

  tags = {
    Name = "Assignment-IGW"
  }
}

# AWS Route

resource "aws_route" "Assignmnet-Pub-IGW-R" {
  route_table_id            = aws_route_table.public-route-table.id
  gateway_id                = aws_internet_gateway.Assignment-IGW.id
  destination_cidr_block    = "0.0.0.0/0"
}