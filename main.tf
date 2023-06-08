provider "aws" {
  region = "us-east-1"
}

# Overall VPC

resource "aws_vpc" "two_tier_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "2-Tier-Achitecture-VPC"
  }
}

# Internet gateway for VPC to have internet connectivity

resource "aws_internet_gateway" "two_tier_ig" {
  vpc_id = aws_vpc.two_tier_vpc.id

  tags = {
    Name = "2-Tier-Achitecture-IG"
  }
}

# Public route table for Web/Presentation tier

resource "aws_route_table" "two_tier_public_RT" {
  vpc_id = aws_vpc.two_tier_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.two_tier_ig.id
  }

  tags = {
    Name = "2-Tier-Public-RT"
  }
}

# Private Route table for Application Tier

resource "aws_route_table" "two_tier_private_RT" {
  vpc_id = aws_vpc.two_tier_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.two_tier_NAT.id
  }

  tags = {
    Name = "2-Tier-Private-RT"
  }
}


# Private Route table for Data Tier

resource "aws_route_table" "two_tier_DB_RT" {
  vpc_id = aws_vpc.two_tier_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.two_tier_NAT_DB.id
  }

  tags = {
    Name = "2-Tier-DB-RT"
  }
}

# NAT gateway for secured internet conncetivity to private subnets note that this is created in a public subnet

resource "aws_nat_gateway" "two_tier_NAT" {
  subnet_id     = module.public_subnet_1.id
  allocation_id = aws_eip.NAT_eip.id

  tags = {
    Name = "Two-Tier-NAT"
  }

  depends_on = [aws_internet_gateway.two_tier_ig]
}

resource "aws_eip" "NAT_eip" {
  domain = "vpc"
}

# NAT gateway for secured internet connectivity to Database tier

resource "aws_nat_gateway" "two_tier_NAT_DB" {
  subnet_id     = module.public_subnet_2.id
  allocation_id = aws_eip.NAT_DB_eip.id

  tags = {
    Name = "Two-Tier-DB-NAT"
  }

  depends_on = [aws_internet_gateway.two_tier_ig]

}

resource "aws_eip" "NAT_DB_eip" {
  domain = "vpc"
}


# Public/ Route Table associations 

resource "aws_route_table_association" "public_RT_1" {
  route_table_id = aws_route_table.two_tier_public_RT.id
  subnet_id      = module.public_subnet_1.id
}

resource "aws_route_table_association" "public_RT_2" {
  route_table_id = aws_route_table.two_tier_public_RT.id
  subnet_id      = module.public_subnet_2.id
}

resource "aws_route_table_association" "public_RT_3" {
  route_table_id = aws_route_table.two_tier_public_RT.id
  subnet_id      = module.public_subnet_3.id
}

# private application Route table subnet associations

resource "aws_route_table_association" "private_RT_1" {
  route_table_id = aws_route_table.two_tier_private_RT.id
  subnet_id      = module.private_subnet_1.id
}

resource "aws_route_table_association" "private_RT_2" {
  route_table_id = aws_route_table.two_tier_private_RT.id
  subnet_id      = module.private_subnet_2.id
}

resource "aws_route_table_association" "private_RT_3" {
  route_table_id = aws_route_table.two_tier_private_RT.id
  subnet_id      = module.private_subnet_3.id
}

# Data tier Route table subnet associations

resource "aws_route_table_association" "data_RT_1" {
  route_table_id = aws_route_table.two_tier_DB_RT.id
  subnet_id      = module.DB_subnet_1.id
}

resource "aws_route_table_association" "data_RT_2" {
  route_table_id = aws_route_table.two_tier_DB_RT.id
  subnet_id      = module.DB_subnet_2.id
}

resource "aws_route_table_association" "data_RT_3" {
  route_table_id = aws_route_table.two_tier_DB_RT.id
  subnet_id      = module.DB_subnet_3.id
}