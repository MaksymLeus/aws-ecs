resource "aws_security_group" "ssh_access" {
  name        = "ssh_access"
  description = "Security group that allows public access over SSH."
  vpc_id      =  var.vpc_id 

  //  SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = { "Name": "ECS Cluster Public SSH Access"}
}
resource "aws_security_group" "http_aceess" {
  name        = "http_aceess"
  description = "Security group that allows public ingress to instances on HTTP."
  vpc_id      = var.vpc_id 

  //  HTTP + Output allow all
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {"Name": "ECS Cluster Public HTTP Access"}
}
resource "aws_security_group" "icmp_access" {
  name        = "icmp_access"
  description = "Security group that allows public icmp access."
  vpc_id      = var.vpc_id 

  //  ICMP allow all
  ingress {
    from_port = -1
    to_port = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {"Name": "ECS Cluster Public ICMP Access"}
}