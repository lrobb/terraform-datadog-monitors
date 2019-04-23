# Global Terraform
variable "environment" {
  description = "Architecture Environment"
  type        = "string"
}

# Global DataDog
variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 15
}

variable "new_host_delay" {
  description = "Delay in seconds before monitor new resource"
  default     = 300
}

variable "prefix_slug" {
  description = "Prefix string to prepend between brackets on every monitors names"
  default     = ""
}

variable "message" {
  description = "Message sent when an alert is triggered"
}

variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
}

variable "filter_tags_custom_excluded" {
  description = "Tags excluded for custom filtering when filter_tags_use_defaults is false"
  default     = ""
}

# Apache Middleware specific

variable "apache_connect_silenced" {
  description = "Groups to mute for Apache status monitor"
  type        = "map"
  default     = {}
}

variable "apache_connect_enabled" {
  description = "Flag to enable Apache status monitor"
  type        = "string"
  default     = "true"
}

variable "apache_connect_extra_tags" {
  description = "Extra tags for Apache process monitor"
  type        = "list"
  default     = []
}

variable "apache_connect_message" {
  description = "Custom message for Apache status monitor"
  type        = "string"
  default     = ""
}

variable "apache_connect_threshold_warning" {
  description = "Apache status monitor (warning threshold)"
  type        = "string"
  default     = 3
}
