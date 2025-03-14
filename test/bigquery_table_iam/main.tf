terraform {
  required_version = "~> 1.5.3"
  required_providers {
    google = {
      version = "~> 4.74.0"
      source  = "hashicorp/google"
    }
  }
}

locals {  
  flattened_role_member_combinations = flatten([
    for role, members in var.role_and_members_bindings : [
      for member in members : {
        role   = role
        member = member
      }
    ]
  ])
}

resource "google_bigquery_table_iam_member" "table_iam_member" {

  for_each = { for idx, combination in local.flattened_role_member_combinations : idx => combination }

  project    = var.project
  dataset_id = var.dataset_id
  table_id   = var.table_id
  role       = each.value.role
  member     = each.value.member
}

























