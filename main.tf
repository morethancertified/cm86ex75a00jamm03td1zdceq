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