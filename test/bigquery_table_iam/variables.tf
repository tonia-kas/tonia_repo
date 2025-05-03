variable "project" {
  description = "The ID of the project in which the BigQuery dataset resides."
}

variable "dataset_id" {
  description = "The ID of the BigQuery dataset."
}

variable "table_id" {
  description = "The ID of the BigQuery table."
}

variable "role_and_members_bindings" {
  description = "A map of roles to members."
  
  type        = map(list(string))
}



