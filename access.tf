resource "okta_group_memberships" "on_call" {
  group_id = data.okta_group.on_call.id
  users = []
}
