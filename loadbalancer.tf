# Loadbalancer facing the application tier where users will hit connections to. 
# In this project, it serves as the web tier entry point

resource "aws_lb" "two-tier_LB" {
  name               = "Two-Tier-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.two_tier_lb_sg.id]

  subnet_mapping {
    subnet_id = module.public_subnet_1.id
  }

  subnet_mapping {
    subnet_id = module.public_subnet_2.id
  }

  subnet_mapping {
    subnet_id = module.public_subnet_3.id
  }

}

# Load balancer target group

resource "aws_lb_target_group" "two_tier_lb_tg" {
  name        = "Two-Tier-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.two_tier_vpc.id

  stickiness {
    enabled = false
    type    = "app_cookie"
  }
}

# Target group attachment to instances

resource "aws_lb_target_group_attachment" "tg_att_01" {
  target_group_arn = aws_lb_target_group.two_tier_lb_tg.arn
  target_id        = module.Two-Tier-App-Server-01.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg_att_02" {
  target_group_arn = aws_lb_target_group.two_tier_lb_tg.arn
  target_id        = module.Two-Tier-App-Server-02.id
  port             = 80
}

# Load balancer Listener to target group

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.two-tier_LB.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.two_tier_lb_tg.arn
  }
}