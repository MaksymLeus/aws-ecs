variable "ecs_cluster_name" {
  description = "The name of ecs cluster"
}
variable "key_name" {
  type        = string
  default = "ssh-key"
  description = "Name for ssh-key"
}
variable "public_key_path" {
  type        = string
  default = "./modules/pub_keys/id_rsa.pub"
  description = "Path for public key"
}
variable "security_groups" {
  description = "A list of security_groups to add to ECS Cluster"
  type        = list
  default     = []
  
}
variable "instance_type" {
  description = "The type of the cluster nodes."
  type = string
  default = "t2.micro"
}
variable "volume_type" {
  description = "The type of volume."
  type = string
  default = "standard"
}
variable "volume_size" {
  description = "The size of volume."
  type = string
  default = "100"
}
variable "delete_on_termination" {
  description = "The delete volume after termination."
  type = bool
  default = true
}

variable "iam_instance_profile" {
  description = "Add instance profile id."
}
variable "associate_public_ip_address" {
  description = "For adding public ip to instance"
  type = string
  default = "true"
}
variable "node_count" {
  description = "The number of nodes"
  type = string
  default = "1"
}

variable "subnet" {
  description = "Add subnet id."
  type        = list
  default     = []
}

variable "region" {
  description = "The region for template_file"
}
