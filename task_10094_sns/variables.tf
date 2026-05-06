variable "access_key" {
  description = "Access key to AWS console"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "Secret key to AWS console"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "Region of AWS VPC"
  type        = string
}

variable "sns_subscription_email" {
  description = "Email endpoint for the SNS subscription"
  type = string
}