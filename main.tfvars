#####################################################################
# aws provider
#####################################################################
  access_key = "..."
  secret_key = "..."

#####################################################################
# Networking
#####################################################################
  region = "us-east-1"
  zone   = "us-east-1a"

#####################################################################
# ECS
#####################################################################
  ecs_cluster_name = "ecs"
  instance_type    = "t2.micro"
  node_count       = "1"
  enable_ecs       = true
  
#####################################################################
# Services
#####################################################################
  desired_count = 1
  min_percent   = 0
  max_percent   = 100

#####################################################################
# Nginx
#####################################################################
  identity = "nginx"
  UPSTEAM = "test"
