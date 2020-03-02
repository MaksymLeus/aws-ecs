variable "region" {
  description = "The region to deploy the cluster in, e.g: us-east-1."
  }
variable "zone" {
  description = "The zone to deploy the cluster in, e.g: us-east-1a."
}
variable "instance_type" {
  description = "The type of the cluster nodes"
}
variable "ecs_cluster_name" {
  description = "Cluster Name"
}
variable "enable_ecs" {
  description = "The enable/disable creation ECS"
}
variable "node_count" {
  description = "The autoscaling nodes"
}

#web app
variable "webapp_cpu" {
  description = "The restriction cpu for webapp"
  type = string
  default = 100
}
variable "webapp_memory" {
  description = "The restriction memory for webapp"
  type = string
  default = 150
}
variable "containerPort" {
  description = "Container port"
  type = string
  default = 80
}
#nginx
variable "nginx_cpu" {
  description = "The restriction  cpu for nginx"
  type = string
  default = 200
}
variable "nginx_memory" {
  description = "The restriction  memory for nginx"
  type = string
  default = 150
}

variable "identity" {
  description = "Environment variable for nginx"
}
variable "UPSTEAM" {
  description = "Environment variable for nginx"
}

#service
variable "desired_count" {
  description = "The number of instances of the task definition"
}
variable "max_percent" {
  description = "The upper limit as a percentage of the number of running tasks"
}
variable "min_percent" {
  description = "The lower limit as a percentage of the number of running tasks"
}

#provider
variable "access_key" {}
variable "secret_key" {}
