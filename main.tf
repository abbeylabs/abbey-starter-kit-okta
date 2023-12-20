locals {
  account_name = ""
  repo_name = ""

  project_path = "github://${local.account_name}/${local.repo_name}"
  policies_path = "${local.project_path}/policies"
}

resource "abbey_grant_kit" "okta_group_has_nice_things" {
  name = "Okta_Group__Has_Nice_Things"
  description = <<-EOT
    This resource represents a Okta Group Membership for engineers looking to have nice things.
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
    location = "${local.project_path}/access.tf"
    append = <<-EOT
      resource "okta_user_group_memberships" "has_nice_things__{{ .user.okta.user_id }}" { # {{ .user.email }}
        user_id = "{{ .user.okta.user_id }}"
        groups = [data.okta_group.has_nice_things.id]
      }
    EOT
  }
}
