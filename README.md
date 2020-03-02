# AWS Elastic Container Service (ECS) Terraform modules

## Terraform module which creates ECS resources on AWS.
---
| Name | Description |
|------|-------------|
| cluster | This module for creation ECS  |
| node | This module for creation node for ECS |
| ecs-instance-profile | This module for creation instance profile for ECS |
| sevices | This module for creation service/task/container in ECS  |
| security_groups | This module for allow SSH, ICMP, and HTTP from  worldwide. |

## Dependencies
---
* In folder `./creads`  id_rsa for node (./modules/pub_keys)
* If you using github link you need to update [ public rsa in ./modules/pub_keys/id_rsa.pub ]

## Specific configuration stored in `main.tfvars` file
___
In file main.tfvars stored environment variables:
* AWS provider [ access_key, secret_key ]
* Networking [ region, zone ]
* ECS [ cluster name, instance_type,node_count, enable_ecs ]
* Services [ desired_count, min_percent, max_percent]
* Nginx [ identity, UPSTEAM ]


## Usage
---
To run this example you need to execute:

```bash
terraform init
terraform plan -var-file="main.tfvars"
terraform apply -var-file="main.tfvars"
```

## Authors
---
All managed by [Maksym Leus](https://hub.docker.com/u/maximleus).
