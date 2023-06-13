
# Securtiy group for Bastion Host

resource "aws_security_group" "bastion_host_sg" {
  name        = "two-tier_bastion-host-sg"
  description = "Security group for Bastion Host on the presentation tier"
  vpc_id      = aws_vpc.two_tier_vpc.id

  ingress {
    description = "SSH into the instance"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow Outbound connectivity"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "two-tier_bastion-host-sg"
  }
}

# Security group for web/application tier servers

resource "aws_security_group" "two_tier_app_sg" {
  name        = "two-tier_app-sg"
  description = "Security group for application servers on the web/application tier"
  vpc_id      = aws_vpc.two_tier_vpc.id

  ingress {
    description     = "SSH into the instance from bastion host"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_host_sg.id]
  }

  ingress {
    description     = "Allow connectivity from LB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.two_tier_lb_sg.id]
  }

  egress {
    description = "Allow Outbound connectivity"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "two-tier_app-sg"
  }
}

# Security group for Load balancer facing the application tier

resource "aws_security_group" "two_tier_lb_sg" {
  name        = "two-tier_LB-sg"
  description = "Security group for load balancer on the web/application tier"
  vpc_id      = aws_vpc.two_tier_vpc.id

  ingress {
    description = "Access to webpage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all Outbound connectivity"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }



  tags = {
    Name = "two-tier_LB-sg"
  }
}

# Security group for data tier database

resource "aws_security_group" "db_tier_sg" {
  name        = "two-tier_db-sg"
  description = "Allow application tier to communicate to database tier"
  vpc_id      = aws_vpc.two_tier_vpc.id

  ingress {
    description     = "Allow connection to database"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.two_tier_app_sg.id]
  }

  tags = {
    Name = "two-tier_db-sg"
  }
}