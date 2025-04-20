**Ticket Type:** Task  
**Title:** Terraform Locals with AWS  
**Project:** Cloud Infrastructure Deployment  
**Assignee:** You  
**Reporter:** Derek Morgan  
**Priority:** High  
**Labels:** Terraform, AWS, VPC, Subnet, Locals  
**Epic Link:** AWS Infrastructure Expansion  
**Sprint:** Sprint 01/Locals

**Lab Setup**
This lab uses Localstack to simulate an AWS environment. Localstack is already preinstalled in your environment. You don't need keys or to configure the provider. If you'd like to use your own account, feel free to specify your provider configuration and run `unset aws` and `unset terraform` to decouple them from Localstack.

**Description:**

A VPC and an associated subnet are needed for your cloud infrastructure. The team wants to be able to create and modify these resources by editing only one file. Below is an example of the resources we need. 

```
resource "aws_vpc" "this" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  
  tags = {
    Name = "infrastructure-dev"
  }
}

resource "aws_subnet" "this" {
  vpc_id     = aws_vpc.this.id
  cidr_block = "10.0.1.0/24"
  
  tags = {
    Name = "infrastructure-dev-subnet"
  }
}
```

**Acceptance Criteria:**

> **Note:** If the `terraform validate` command fails, all tasks in the lab will fail!

1\. Create a `locals.tf` file with the necessary `locals` data structure to store the needed information. The items that need to be in the `locals.tf` file are:
```  
name                = "${var.project}-${var.env}"  
description         = "${var.project} ${var.env} VPC"  
cidr_block          = "10.0.0.0/16"  
enable_dns          = var.env == "dev" ? false : true  
subnet_cidr_block   = "10.0.1.0/24"  
subnet_name         = "${var.project}-${var.env}-subnet"
```  
2\. Create the AWS VPC resource and reference the items in the data structure as needed.   
3\. Create the AWS subnet resource and reference the items in the data structure as needed.   
4\. If you already have variables or conditionals created for the attributes, feel free to use those. Otherwise, the attributes can be hardcoded in the `locals` block. 

**Implementation Notes:**

Feel free to use code from previous labs. The values aren't as important as the concepts. 

- <a href="https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc" target="_blank">AWS VPC Resource Documentation</a>  
- <a href="https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet" target="_blank">AWS Subnet Resource Documentation</a>  
- <a href="https://developer.hashicorp.com/terraform/language/values/locals" target="_blank">Terraform Locals Documentation</a>
