# BigQuery Table IAM Members Module

This Terraform module manages IAM bindings for a BigQuery table, allowing you to grant specific roles to one or more members. The role addition is non-authoritative, other members for the role for the table are preserved. More info about the used resource `google_bigquery_table_iam_member` can be found [here](https://registry.terraform.io/providers/hashicorp/google/4.74.0/docs/resources/bigquery_table_iam)

## Usage

```hcl
terraform {
  required_version = "~> 1.5.3"
  backend "gcs" {
    bucket = "tfstate-test"
    prefix = "iam/bigquery-table-policies"
  }
  required_providers {
    google = {
      version = "~> 4.74.0"
      source  = "hashicorp/google"
    }
  }
}

data "google_project" "current" {
  project_id = "test-project"
}

module "bigquery_table_iam" {
  source                 = ""github.com/GlobalWebIndex/terraform-modules.git//bigquery_table_iam?ref=v3.134.0&depth=1""
  project                = data.google_project.current.project_id
  dataset_id             = "test_dataset"
  table_id               = "test_table_id"
  role_and_members_bindings = {
    "roles/bigquery.dataViewer" = ["user:user1@example.com", "user:user2@example.com"],
    "roles/bigquery.admin"      = ["user:admin1@example.com"]
  }
}
```

Inputs
* `project`: The ID of the project in which the BigQuery dataset resides.
* `dataset_id`: The ID of the BigQuery dataset.
* `table_id`: The ID of the BigQuery table.
* `role_and_members_bindings`: A map of roles to members.



