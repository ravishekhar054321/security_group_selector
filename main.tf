variable "vpc_id" {
  type    = string
  default = null
}

variable "security_group_name" {
  description = "A security group name"
  type        = string
  default     = ""
}

variable "security_group_names" {
  description = "A list of security group names"
  type        = list(string)
  default     = []
}

locals {
  security_group_names = (var.vpc_id == null) ? [] : compact(setunion([var.security_group_name], var.security_group_names))
}

data "aws_security_group" "selected" {
  for_each = toset(local.security_group_names)
  name     = each.key
  vpc_id   = var.vpc_id
}
