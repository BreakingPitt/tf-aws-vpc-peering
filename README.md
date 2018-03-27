AWS VPC Peering Terraform Module
================================

This repository contains a Terraform module designed to create VPC peering
connection between two exsiting AWS VPCs.

This module is designed to work with the VPC module from Terraform module registry.

Getting Started
---------------

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

Prerequisites
-------------

Built With
----------

* [Terraform](http://www.terraform.io/)

Terraform 0.11.3 or newer is required for this module to work.

Dependencies
------------

* Terraform 0.11.3
* An AWS account

Examples
--------

* [Simple VPC Peering](examples/vpc-peering)

Module Usage
------------

Sample usage in combination with VPC Terraform module:

``` hcl
module "vpc_peering_vpc_a_vpc_b"  {
  auto_accept_peering     = "false"
  aws_owner_account_id    = "000000000000"
  local_aws_vpc_id        = "vpc-ff32e599" # Vpc Name: vpc-a
  remote_aws_vpc_id       = "vpc-e737ec81" # Vpc Name: vpc-b
  local_aws_vpc_cidr      = "10.0.0.0/16"
  remote_aws_vpc_cidr     = "11.0.0.0/16"
  local_route_table_ids   = [ "rtb-7cd4ce1a","rtb-c6d0caa0","rtb-abcad0cd","rtb-85d4cee3" ]
  remote_route_table_ids  = [ "rtb-02cf277b","rtb-c1c42cb8", "rtb-86d830ff", "rtb-bac129c3" ]
  source                  = "./tf-aws-vpc-peering"
}
```

Dependencies
------------

* Terraform 0.11.3
* An AWS account

Terraform Usage
---------------

**1\. Ensure your AWS credentials are set up.**

This can be done using environment variables:

``` bash
$ export AWS_SECRET_ACCESS_KEY='your secret key'
$ export AWS_ACCESS_KEY_ID='your key id'
```

... or the `~/.aws/credentials` file.

```
$ cat ~/.aws/credentials
[default]
aws_access_key_id = your key id
aws_secret_access_key = your secret key

```

**2\. Review the Terraform plan.**

Execute the below command and ensure you are happy with the plan.

``` bash
$ terraform plan
```

**3\. Execute the Terraform apply.**

Now execute the plan to provision the AWS resources.

``` bash
$ terraform apply
```


**4\. Destroy the resources.**

Once you are finished your testing, ensure you destroy the resources to avoid unnecessary AWS charges.

``` bash
$ terraform destroy
```
