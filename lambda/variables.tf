variable "env" {
  description = "Environment name."
  type        = string
}

variable "role_name" {
  description = "IAM role name"
  type        = string
}

variable "function_name" {
  description = "Lambd Function Name name"
  type        = string
}

variable "zipfile_name" {
  description = "Zipfile name"
  type        = string
}

variable "codefile_name" {
  description = "Codefile name"
  type        = string
}