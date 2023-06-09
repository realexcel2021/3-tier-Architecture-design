
# Securtiy group for Bastion Host

resource "aws_security_group" "bastion_host_sg" {
    name = "two-tier_bastion-host-sg"
    description = "Security group for Bastion Host on the presentation tier"
    vpc_id = aws_vpc.two_tier_vpc.id

    ingress {
        description = "SSH into the instance"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    egress {
        description = "Allow Outbount connectivity"
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "two-tier_bastion-host-sg"
    }
}

# Security group for web/application tier

resource "aws_security_group" "two_tier_app_sg" {
    name = "two-tier_app-sg"
    description = "Security group for application servers on the web/application tier"
    vpc_id = aws_vpc.two_tier_vpc.id

    ingress {
        description = "SSH into the instance from bastion host"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        security_groups = [ aws_security_group.bastion_host_sg.id ]
    }

    egress {
        description = "Allow Outbount connectivity"
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "two-tier_app-sg"
    }
}