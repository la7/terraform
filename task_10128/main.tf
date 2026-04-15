provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}
################## Launching EC2 Instance ##################
resource "aws_instance" "web-server" {
    ami             = "ami-0150ccaf51ab55a51"
    instance_type   = "t2.micro"
    tags = {
        Name = "MyEC2Server"
    }
}
