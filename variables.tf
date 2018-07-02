variable "region" {
  description = "This is the AWS region. It must be provided, but it can also be sourced from the AWS_DEFAULT_REGION environment variables, or via a shared credentials file if profile is specified."
  default     = "eu-central-1"
}

variable "environment" {
  description = "Deployment environment"
}

variable "project" {
  description = "Specify to which project this resource belongs"
}

variable "key_name" {
  description = "Key pair name to be used"
}
