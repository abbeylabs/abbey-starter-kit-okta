provider "abbey" {
  bearer_auth = var.abbey_token
}

provider "okta" {
  org_name  = var.okta_org_name
  base_url  = var.okta_base_url
}
