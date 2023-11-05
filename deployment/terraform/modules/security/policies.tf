resource "aws_iam_policy" "ecr_task_exec_policy" {
  name   = "${var.PROJECT_NAME}-ecr-task-exec-policy"
  policy = data.template_file.ecr_task_exec_policy_temp.rendered
}

resource "aws_iam_policy" "rds_full_access_policy" {
  name   = "${var.PROJECT_NAME}-rds-full-access-policy"
  policy = data.template_file.rds_full_policy_temp.rendered
}
