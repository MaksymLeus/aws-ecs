//  SSH keypair to access instances.
resource "aws_key_pair" "keypair" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
  tags = { "pubkey": "ecs"}
}

//  A userdata script for instances.
data "template_file" "node_userdata" {
  template = file("${path.module}/user-data.sh")

  vars = {
    region = var.region
    ecs_cluster_name = var.ecs_cluster_name
  }
}

//  The latest ECS AMI
data "aws_ami" "latest_ecs" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-2.0.20200218-x86_64-ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }  
}

//  A Launch Configuration for ECS cluster instances.
resource "aws_launch_configuration" "ecs_cluster_node" {

  name   = "ecs-cluster-node"
  image_id                    = data.aws_ami.latest_ecs.id
  instance_type               = var.instance_type
  iam_instance_profile        = var.iam_instance_profile

  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_size 
    delete_on_termination = var.delete_on_termination
  }

  lifecycle {
    create_before_destroy = true
  }
  security_groups = var.security_groups
  associate_public_ip_address = var.associate_public_ip_address
  user_data                   = data.template_file.node_userdata.rendered
  key_name = aws_key_pair.keypair.key_name
}
resource "aws_autoscaling_group" "ecs_cluster_node" {
  name                        = "ecs_cluster_node"
  min_size                    = var.node_count
  max_size                    = var.node_count
  desired_capacity            = var.node_count
  vpc_zone_identifier         =  var.subnet
  launch_configuration        = aws_launch_configuration.ecs_cluster_node.name
  health_check_type           = "ELB"

  lifecycle {
    create_before_destroy = true
  }

  tags = [
    {
      key = "Name",
      value = "ECS Cluster Instance",
      propagate_at_launch = true 
    }
  ]
}