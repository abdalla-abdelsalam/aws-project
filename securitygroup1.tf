# Create Security Group for SSH from 0.0.0.0/0 to use with public instance
resource "aws_security_group" "sg1" {
  vpc_id = module.mynetwork.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "security-group1"
  }
}

