variable "cluster_id" {
  description = "The ECS cluster ID"
}
#web app
variable "webapp_cpu" {
  description = "The restriction cpu for webapp"
}
variable "webapp_memory" {
  description = "The restriction memory for webapp"
}
variable "containerPort" {
  description = "The container port"
}
#nginx
variable "nginx_cpu" {
  description = "The restriction  cpu for nginx"
}
variable "nginx_memory" {
  description = "The restriction  memory for nginx"
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