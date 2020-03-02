[
  {
    "name": "webapp1",
    "image": "maximleus/webapp:2",
    "cpu": ${webapp_cpu},
    "memory": ${webapp_memory},

    "essential": true
  },
  {
    "name": "webapp2",
    "image": "maximleus/webapp:2",
    "cpu": ${webapp_cpu},
    "memory": ${webapp_memory},

    "essential": true
  },
  {
    "name": "nginx",
    "image": "maximleus/nginx:2",
    "cpu": ${nginx_cpu},
    "memory": ${nginx_memory},
    "links": ["webapp1","webapp2"],
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ],
    "environment": [
      {
        "name": "IDENTITY_ID",
        "value": "${identity}"
      },
      {
        "name": "UPSTEAM",
        "value": "${UPSTEAM}"
      }
    ]
  }
]