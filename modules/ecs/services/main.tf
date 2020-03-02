data "template_file" "service_tasks" {
  template = file("${path.module}/tasks.json.tpl")

  vars = {
    webapp_cpu    = var.webapp_cpu
    webapp_memory = var.webapp_memory
    containerPort = var.containerPort
    nginx_cpu     = var.nginx_cpu
    nginx_memory  = var.nginx_memory
    identity      = var.identity
    UPSTEAM       = var.UPSTEAM
  }
}
resource "aws_ecs_task_definition" "service_tasks" {
  family                = "service"
  container_definitions = data.template_file.service_tasks.rendered
}
resource "aws_ecs_service" "main" {
  name = "main"
  cluster = var.cluster_id
  task_definition = aws_ecs_task_definition.service_tasks.arn
  desired_count = var.desired_count
  deployment_maximum_percent = var.max_percent
  deployment_minimum_healthy_percent = var.min_percent
}