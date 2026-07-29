output "security_group_ids" {
  description = "List of IDs of Security Group"
  value = flatten([
    for sg in distinct(local.security_group_names) :
    data.aws_security_group.selected[sg].id
  ])
}
