data "archive_file" "lambda_zip" {
    type        = "zip"
    source_file = "lambda_script.py"
    output_path = "lambda_script.zip"
  }
resource "aws_lambda_function" "api_lambda" {
  filename      = data.archive_file.lambda_zip.output_path
  function_name = local.resource_name_prefix
  #role = data.terraform_remote_state.iam_role.outputs.iam_role_arn
  role          = "${module.iam_role.iam_role_arn}"
  handler       = local.lambda_handler

  source_code_hash = data.archive_file.lambda_zip.output_path
  runtime = local.lambda_runtime
  timeout = local.lambda_timeout
  reserved_concurrent_executions = local.lambda_concurrent_executions
  depends_on = [
    module.iam_role
  ]
}

locals {
    prefix                        = "api_lambda"
    resource_name_prefix          = "${local.prefix}"
    lambda_handler                = "lambda_script.lambda_handler"
    lambda_description            = "Lambda function for API to interact with Lambda"
    lambda_runtime                = "python3.9"
    lambda_timeout                = 5
    lambda_concurrent_executions  = -1
    name                          = "api_lambda"
  }