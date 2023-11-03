# Use an existing Jenkins image as the base image
FROM jenkins/jenkins:lts

# Install necessary packages and update
USER root
RUN apt-get update && apt-get install -y \
    curl \
    unzip

# Install Terraform
RUN curl -LO https://releases.hashicorp.com/terraform/0.15.5/terraform_0.15.5_linux_amd64.zip && \
    unzip terraform_0.15.5_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_0.15.5_linux_amd64.zip

# Install Docker
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce-cli

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/kubectl    

# Install AWS cli
# RUN curl -LO "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
#     sudo apt install unzip && \
#     unzip awscliv2.zip && \
#     sudo ./aws/install

RUN apt-get update && \
    apt-get install -y awscli && \
    apt-get clean

# Switch back to the Jenkins user
USER jenkins