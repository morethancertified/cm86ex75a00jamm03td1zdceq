**Ticket Type:** Task  
**Title:** Terraform Locals  
**Project:** Version Control System Deployment  
**Assignee:** You  
**Reporter:** Derek Morgan  
**Priority:** High  
**Labels:** Terraform, GitHub, Locals  
**Epic Link:** GitHub Expansion  
**Sprint:** Sprint 01/Locals

**Description:**

A repository and an associated staging branch are needed for code. The team wants to be able to create and modify these resources by editing only one file. Below is an example of the resources we need. 

```
resource "github_repository" "this" {
  name               = "infrastructure-dev"
  description        = "Infrastructure Dev Repository"
  auto_init          =  true
  visibility         = "public"
  gitignore_template = "Terraform"
}

resource "github_branch" "this" {
  repository = github_repository.this.name
  branch     = "staging"
}

```

**Acceptance Criteria:**

> **Note:** If the `terraform validate` command fails, all tasks in the lab will fail!

1\. Create a `locals.tf` file with the necessary `locals` data structure to store the needed information. The items that need to be in the `locals.tf` file are:
```  
name               = "${var.project}-${var.env}"  
description        = "${var.project} ${var.env} repository"  
auto_init          = true  
visibility         = var.env == "dev" ? "private" : "public"  
gitignore_template = "Terraform"  
branch_name        = "staging"
```  
2\. Create the GitHub repository resource and reference the items in the data structure as needed.   
3\. Create the GitHub branch and reference the items in the data structure as needed.   
4\. If you already have variables or conditionals created for the attributes, feel free to use those. Otherwise, the attributes can be hardcoded in the `locals` block. 

**Implementation Notes:**

Feel free to use code from previous labs. The values aren’t as important as the concepts. 

- <a href="https://registry.terraform.io/providers/integrations/github/latest/docs" target="_blank">GitHub Provider Documentation</a>  
- <a href="https://developer.hashicorp.com/terraform/language/values/locals" target="_blank">Terraform Documentation</a>
