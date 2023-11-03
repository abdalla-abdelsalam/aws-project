# Create Bastion EC2 Instance in Public Subnet
resource "aws_instance" "bastion_instance" {

  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = module.mynetwork.pub_subnets[0].id

  vpc_security_group_ids = [aws_security_group.sg1.id]

  key_name = aws_key_pair.terraform-key2.id


  user_data = <<-EOF
    #!/bin/bash

    ## install docker
    apt-get update
    apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    apt-get update
    apt-get install -y docker-ce docker-ce-cli containerd.io

    ## clone my repo
    git clone https://github.com/abdalla-abdelsalam/aws-project.git
    cd aws-project

    ## run jenkins
    sudo docker build -t jenkins-image -f Dockerfile .
    sudo docker run -d -p 8080:8080 -p 50000:50000 --name jenkins jenkins-image
    sudo docker start jenkins
  EOF

  tags = {
    Name = "bastion_instance"
  }

}