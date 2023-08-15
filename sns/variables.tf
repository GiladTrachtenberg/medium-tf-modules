variable "env" {
  description = "Environment name."
  type        = string
}

variable "backups_topic_name" {
  description = "s3-backups-alarm-topic"
  type        = string
}

variable "email_addresses" {
  description = "a list of email addresses to use"
  type    = list(string)
}