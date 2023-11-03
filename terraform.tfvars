# variables values for development environment
vpc_cidr           = "10.0.0.0/16"
ami_id             = "ami-053b0d53c279acc90"
instance_type      = "t2.micro"
sub_public         = ["10.0.1.0/24", "10.0.2.0/24"]
sub_private        = ["10.0.3.0/24", "10.0.4.0/24"]
region             = "us-east-1"
availability_zones = ["us-east-1a", "us-east-1b"]
lambda_role_name   = "lambda_role_dev"
