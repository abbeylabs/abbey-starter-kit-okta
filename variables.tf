variable "okta_org_name" {
  type = string
  sensitive = true
  default = "dev-123456" # CHANGEME
}

variable "okta_base_url" {
  type = string
  sensitive = true
  default = "oktapreview.com" # CHANGEME
}
