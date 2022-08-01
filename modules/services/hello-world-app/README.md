## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.0.0, < 2.0.0)

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (~> 4.0)

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws) (~> 4.0)

## Modules

The following Modules are called:

### <a name="module_alb"></a> [alb](#module\_alb)

Source: ../../networking/alb

Version:

### <a name="module_asg"></a> [asg](#module\_asg)

Source: ../../cluster/asg-rolling-deploy

Version:

### <a name="module_data-store"></a> [data-store](#module\_data-store)

Source: ../../data-stores

Version:

## Resources

The following resources are used by this module:

- [aws_lb_listener_rule.asg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) (resource)
- [aws_lb_target_group.asg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) (resource)
- [aws_subnets.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) (data source)
- [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage)

Description: The amount of storage that should be allocated to the database

Type: `string`

### <a name="input_ami"></a> [ami](#input\_ami)

Description: The AMI to run in the cluster

Type: `string`

### <a name="input_db_password"></a> [db\_password](#input\_db\_password)

Description: The password for the database

Type: `string`

### <a name="input_db_remote_state_bucket"></a> [db\_remote\_state\_bucket](#input\_db\_remote\_state\_bucket)

Description: The name of the S3 bucket for the database's remote state

Type: `string`

### <a name="input_db_remote_state_key"></a> [db\_remote\_state\_key](#input\_db\_remote\_state\_key)

Description: The path for the database's remote state in S3

Type: `string`

### <a name="input_enable_autoscaling"></a> [enable\_autoscaling](#input\_enable\_autoscaling)

Description: If set to true, enable auto scaling

Type: `string`

### <a name="input_engine"></a> [engine](#input\_engine)

Description: The type of database engine that should be deployed. I.E. 'mysql', 'postgres' or 'oracle'

Type: `string`

### <a name="input_environment"></a> [environment](#input\_environment)

Description: The name of the environment we're deploying to

Type: `string`

### <a name="input_identifier_prefix"></a> [identifier\_prefix](#input\_identifier\_prefix)

Description: The database identifier prefix that will be listed as part of the DB identifier

Type: `string`

### <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class)

Description: The database server instance class type. I.E. 'db.t2.micro', 'db.t2.large' etc.

Type: `string`

### <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type)

Description: The type of EC2 Instances to run (e.g. t2.micro)

Type: `string`

### <a name="input_max_size"></a> [max\_size](#input\_max\_size)

Description: The maximum number of EC2 Instances in the ASG

Type: `number`

### <a name="input_min_size"></a> [min\_size](#input\_min\_size)

Description: The minimum number of EC2 Instances in the ASG

Type: `number`

### <a name="input_server_text"></a> [server\_text](#input\_server\_text)

Description: The text the web server should return

Type: `string`

### <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot)

Description: Whether a final snapshot should be taken of the database before destruction. This is either 'true' or 'false'

Type: `string`

### <a name="input_username"></a> [username](#input\_username)

Description: The admin username to log into the database

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_custom_tags"></a> [custom\_tags](#input\_custom\_tags)

Description: Custom tags to set on the Instances in the ASG

Type: `map(string)`

Default: `{}`

### <a name="input_db_name"></a> [db\_name](#input\_db\_name)

Description: The name of the mysql database

Type: `string`

Default: `"stage"`

### <a name="input_db_username"></a> [db\_username](#input\_db\_username)

Description: The username of the user to be configured to log into the mysql database

Type: `string`

Default: `"admin"`

### <a name="input_server_port"></a> [server\_port](#input\_server\_port)

Description: The port the server will use for HTTP requests

Type: `number`

Default: `8080`

## Outputs

The following outputs are exported:

### <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name)

Description: The domain name of the load balancer

### <a name="output_alb_http_listener_arn"></a> [alb\_http\_listener\_arn](#output\_alb\_http\_listener\_arn)

Description: The ARN of the HTTP listener

### <a name="output_alb_security_group_id"></a> [alb\_security\_group\_id](#output\_alb\_security\_group\_id)

Description: The ALB Security Group ID

### <a name="output_asg_instance_security_group_id"></a> [asg\_instance\_security\_group\_id](#output\_asg\_instance\_security\_group\_id)

Description: The ID of the EC2 Instance Security Group

### <a name="output_asg_name"></a> [asg\_name](#output\_asg\_name)

Description: The name of the Auto Scaling Group

### <a name="output_db_address"></a> [db\_address](#output\_db\_address)

Description: Connect to the database at this endpoint

### <a name="output_db_port"></a> [db\_port](#output\_db\_port)

Description: The port the database is listening on
