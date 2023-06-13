# Bastion Host Amazon Linux 2 Server

resource "aws_instance" "two_tier_bastion_host" {
  ami                    = "ami-09988af04120b3591"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.two_tier_key_pair.key_name
  subnet_id              = module.public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.bastion_host_sg.id]

  tags = {
    Name = "Two-Tier-Bastion-Host"
  }
}

resource "aws_launch_template" "app_tier_instances" {
    name = "Two-Tier-Launch-Template"
    image_id = "ami-09988af04120b3591"
    instance_type = "t2.micro"
    key_name = aws_key_pair.two_tier_key_pair.key_name
    user_data = filebase64("${path.module}/launch_data.sh")
    vpc_security_group_ids = [ aws_security_group.two_tier_app_sg.id ]
}

resource "aws_autoscaling_group" "app_tier_asg" {
    availability_zones = [ "us-east-1a", "us-east-1b", "us-east-1c" ]
    desired_capacity = 3
    min_size = 2
    max_size = 3
    vpc_zone_identifier = [ module.private_subnet_1.id, module.private_subnet_2.id, module.private_subnet_3.id]

    launch_template {
        id = aws_launch_template.app_tier_instances.id
        version = "$Latest" 
    }
}
