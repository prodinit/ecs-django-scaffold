data "template_file" "ecr_task_exec_trust_temp" {
  template = file("${path.module}/policy_json/ecr_task_exec_trust.json")
}

data "template_file" "ecr_task_exec_policy_temp" {
  template = file("${path.module}/policy_json/ecr_task_exec_policy.json")
}

data "template_file" "rds_full_policy_temp" {
  template = file("${path.module}/policy_json/rds_full_access_policy.json")
}
