module "public_subnet_1" {
  source                  = "./modules/Subnet"
  vpc_id                  = aws_vpc.two_tier_vpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"
  Name                    = "2-Tier-Public-AZ1"
  map_public_ip_on_launch = true
}

module "public_subnet_2" {
  source                  = "./modules/Subnet"
  vpc_id                  = aws_vpc.two_tier_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1b"
  Name                    = "2-Tier-Public-AZ2"
  map_public_ip_on_launch = true
}

module "public_subnet_3" {
  source                  = "./modules/Subnet"
  vpc_id                  = aws_vpc.two_tier_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1c"
  Name                    = "2-Tier-Public-AZ3"
  map_public_ip_on_launch = true
}

module "private_subnet_1" {
  source            = "./modules/Subnet"
  vpc_id            = aws_vpc.two_tier_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  Name              = "2-Tier-private-AZ1"
}

module "private_subnet_2" {
  source            = "./modules/Subnet"
  vpc_id            = aws_vpc.two_tier_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"
  Name              = "2-Tier-private-AZ2"
}

module "private_subnet_3" {
  source            = "./modules/Subnet"
  vpc_id            = aws_vpc.two_tier_vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "us-east-1c"
  Name              = "2-Tier-private-AZ3"
}

module "DB_subnet_1" {
  source            = "./modules/Subnet"
  vpc_id            = aws_vpc.two_tier_vpc.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "us-east-1a"
  Name              = "2-Tier-DB-AZ1"
}

module "DB_subnet_2" {
  source            = "./modules/Subnet"
  vpc_id            = aws_vpc.two_tier_vpc.id
  cidr_block        = "10.0.7.0/24"
  availability_zone = "us-east-1b"
  Name              = "2-Tier-DB-AZ2"
}

module "DB_subnet_3" {
  source            = "./modules/Subnet"
  vpc_id            = aws_vpc.two_tier_vpc.id
  cidr_block        = "10.0.8.0/24"
  availability_zone = "us-east-1c"
  Name              = "2-Tier-DB-AZ3"
}

