locals {
  account_name = ""
  repo_name = ""

  project_path = "github://${local.account_name}/${local.repo_name}"
  policies_path = "${local.project_path}/policies"
}

resource "abbey_grant_kit" "okta_group_on_call" {
  name = "Okta_Group__on_call"
  description = <<-EOT
    This resource represents a Okta Group Membership for engineers on call.
  EOT

  workflow = {
    steps = [
      {
        reviewers = {
          one_of = ["replace-me@example.com"] # CHANGEME
        }
      }
    ]
  }

  policies = [
    { bundle = local.policies_path }
  ]

  output = {
    location = "${local.project_path}/access.tf#okta_group_memberships.on_call.users"
    append = "{{ .user.okta.user_id }}"
  }
}
