data "archive_file" "lambda_zip" {
    type        = "zip"
    source_file = var.lambda_source_template
    output_path = "lambda_template.zip"
  }
resource "aws_lambda_function" "lambda_fn" {
  filename      = data.archive_file.lambda_zip.output_path
  function_name = var.function_name
  #role = data.terraform_remote_state.iam_role.outputs.iam_role_arn
  role          = "${module.iam_role.iam_role_arn}"
  handler       = var.handler

  source_code_hash = data.archive_file.lambda_zip.output_path
  runtime = var.lambda_runtime
  timeout = var.lambda_timeout
  reserved_concurrent_executions = var.lambda_concurrent_executions
  depends_on = [
    module.iam_role
  ]
}