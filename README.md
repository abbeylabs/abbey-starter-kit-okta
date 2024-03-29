# Abbey Starter Kit Okta

This example shows how to create a single step Grant Kit workflow.
The example features requesting access to an [Okta User Group Membership](https://registry.terraform.io/providers/okta/okta/latest/docs/resources/user_group_memberships)
from multiple reviewers, requiring only `one_of` the reviewers to approve the access.

## Usage

- Let's say you have an Okta org, and you would like to assign engineers who are on-call to have access to certain apps.
- You can assign the apps to a user group `On call`, then set up Abbey Quickstart
  - Make sure to [configure your GitHub Actions Secrets](https://docs.abbey.io/product/deploying-your-grant-kit#step-1-add-your-abbey_token) and add `OKTA_API_TOKEN` and `ABBEY_TOKEN`
- When the user is on call, they can request access to be added to `On call` user group via Abbey. This will create a PR appending the user ID to the existing `okta_group_membership.on_call` resource in `access.tf`:
  ```diff
   resource "okta_group_memberships" "on_call" {
     group_id = "00gSomeOktaUserGroupId"
  -  users = ["00uSomeOktaUserId1"]
  +  users = ["00uSomeOktaUserId1", "00uSomeOktaUserId2"]
   }
  ```
- Once approved, the user will be added to the group and will be assigned to all the apps assigend to the group.
- When the access is revoked, the user will be removed from the `On call` group only

## :books: Learn More

To learn more about Grant Kits and Grant Workflows, visit the following resources:

-   [Abbey Labs Documentation](https://docs.abbey.io) - learn about automating access management with Abbey Labs.
