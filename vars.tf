# Region in which resources need to be created
variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

# Runtime environment in which this lambda to be created 
variable "lambda_runtime" {
  description = "Run time environment"
  type        = string
  default     = "python3.9"
}

# Lambda function name  
variable "function_name" {
  description = "Lambda function Name"
  type        = string
  default     = "sample_lambda_fn"
}

# Lambda function handler  
variable "handler" {
  description = "Lambda function Handler"
  type        = string
  default     = "lambda_template.lambda_handler"
}

# Lambda function timeout in seconds 
variable "lambda_timeout" {
  description = "Lambda function timeout"
  type        = number
  default     = 5
}

# Lambda function concurrent executions  
variable "lambda_concurrent_executions" {
  description = "Lambda function concurrent executions"
  type        = number
  default     = -1
}
