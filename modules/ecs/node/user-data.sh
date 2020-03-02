#!/bin/bash

ln -fs /usr/share/zoneinfo/Europe/Kiev /etc/localtime

# ECS config
{
  echo "ECS_CLUSTER=${ecs_cluster_name}"
} >> /etc/ecs/ecs.config


echo "Done"