provider "aws" {
    region     = "${var.region}"
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
}			

# ALB Security Group
resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Allow HTTP from anywhere"
  vpc_id      = data.aws_vpc.default.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# EC2 Security Group
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  description = "Allow HTTP from ALB only"
  vpc_id      = data.aws_vpc.default.id
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}			

################## Creating 2 EC2 Instances ##################
resource "aws_instance" "web_server" {
  ami           = "ami-0150ccaf51ab55a51"
  instance_type = "t2.micro"
  count         = 2
  key_name      = "whizlabs-key"
  security_groups = [aws_security_group.ec2_sg.name]

  user_data = <<-EOF
       #!/bin/bash
       sudo dnf update -y
       sudo dnf install -y httpd
       sudo systemctl start httpd
       sudo systemctl enable httpd
       echo "<html><h1>Welcome to Whizlabs. Happy Learning from $(hostname -f)...</h1></html>" > /var/www/html/index.html
  EOF

  tags = {
    Name = "instance-${count.index + 1}"
  }
}			

###################### Default VPC and Subnets ######################
data "aws_vpc" "default" {
  default = true
}
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}			

#################### Creating Target Group ####################
resource "aws_lb_target_group" "target_group" {
  name        = "whiz-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.aws_vpc.default.id

  health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
}			

############# Creating Application Load Balancer #############
resource "aws_lb" "application_lb" {
  name               = "whiz-alb"
  internal           = false
  ip_address_type    = "ipv4"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = data.aws_subnets.default.ids

  tags = {
    Name = "whiz-alb"
  }
}
 
######################## Creating Listener ######################
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.application_lb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}			

################ Attaching Target group to ALB ################
resource "aws_lb_target_group_attachment" "ec2_attach" {
  count            = length(aws_instance.web_server)
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = aws_instance.web_server[count.index].id
}			