variable "rds_username" {
  description = "Username for the RDS instance"
  type        = string
}

variable "rds_password" {
  description = "Password for the RDS instance"
  type        = string
  sensitive   = true
}
