# Lambda function ARN
output "lambda_arn" {
  value = aws_lambda_function.lambda_fn.arn
}

# Invoke ARN
output "invoke_arn" {
  value = aws_lambda_function.lambda_fn.invoke_arn
}

# Lambda Function Name
output "function_name" {
  description = "Name of the Lambda function."
  value = aws_lambda_function.lambda_fn.function_name
}