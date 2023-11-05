resource "aws_iam_role" "ecr_task_execution" {
  name               = "${var.PROJECT_NAME}-ecr-task-execution-role"
  assume_role_policy = data.template_file.ecr_task_exec_trust_temp.rendered
  managed_policy_arns = [
    aws_iam_policy.ecr_task_exec_policy.arn,
    aws_iam_policy.rds_full_access_policy.arn,
  ]
  tags = {
    "Name" : "ECR Task Execution role",
    "resource" : "TASK EXEC IAM role",
  }
}
