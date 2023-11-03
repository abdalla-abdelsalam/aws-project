#Generate public and private key pair
resource "tls_private_key" "rsa-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

#create aws key pair by public key from tls_private_key
resource "aws_key_pair" "terraform-key2" {
  key_name   = "terraform-key2"
  public_key = tls_private_key.rsa-key.public_key_openssh
}

#store private key pair into my machine for ssh connection
resource "local_file" "tf-key2" {
  content  = tls_private_key.rsa-key.private_key_pem
  filename = "terraform-key2.pem"
}    