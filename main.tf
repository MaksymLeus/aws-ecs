#####################################################################
# Networking
#####################################################################
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}
resource "aws_default_subnet" "default_sub" {
  availability_zone = var.zone

  tags = {
    Name = "Default subnet for us-east-1a"
  }
}

module "security_groups" {
  source = "./modules/networking/security_groups"

  vpc_id = aws_default_vpc.default.id
}
#####################################################################
# ECS
#####################################################################
module "ecs" {
  source = "./modules/ecs/cluster"

  name   = var.ecs_cluster_name
  tags   = { "Name": "${var.ecs_cluster_name}", "Node": "EC2" }
  enable_ecs = var.enable_ecs
}
module "instance_profile" {
  source = "./modules/ecs/ecs-instance-profile"
}
module "node" {
  source               = "./modules/ecs/node"

  iam_instance_profile = module.instance_profile.id
  subnet               = [ aws_default_subnet.default_sub.id ]
  region               = var.region
  ecs_cluster_name     = var.ecs_cluster_name
  instance_type        = var.instance_type
  node_count           = var.node_count 
  security_groups      = [
    module.security_groups.ssh_access_id,
    module.security_groups.http_aceess_id,
    module.security_groups.icmp_access_id
  ]
}

#####################################################################
# Services
#####################################################################
module "services" {
  source        = "./modules/ecs/services"

  cluster_id    = module.ecs.ecs_cluster_id
  webapp_cpu    = var.webapp_cpu
  webapp_memory = var.webapp_memory
  containerPort = var.containerPort
  nginx_cpu     = var.nginx_cpu
  nginx_memory  = var.nginx_memory
  identity      = var.identity
  UPSTEAM       = var.UPSTEAM
  desired_count = var.desired_count
  max_percent   = var.max_percent
  min_percent   = var.min_percent
}