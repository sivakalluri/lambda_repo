# Lambda function ARN
output "lambda_arn" {
  value = aws_lambda_function.api_lambda.arn
}

# Invoke ARN
output "invoke_arn" {
  value = aws_lambda_function.api_lambda.invoke_arn
}

# Lambda Function Name
output "function_name" {
  description = "Name of the Lambda function."
  value = aws_lambda_function.api_lambda.function_name
}