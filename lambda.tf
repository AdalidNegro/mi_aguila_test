data "archive_file" "lambda_1_zip" {
  type        = "zip"
  source_file = "1.js"
  output_path = "lambda_1.zip"
}

data "archive_file" "lambda_2_zip" {
  type        = "zip"
  source_file = "2.js"
  output_path = "lambda_2.zip"
}

data "archive_file" "lambda_3_zip" {
  type        = "zip"
  source_file = "3.js"
  output_path = "lambda_3.zip"
}

resource "aws_lambda_function" "lambda_1" {
  filename = "1.zip"

  function_name    = "${var.environment}_mi_aguila_lambda_1"
  role             = aws_iam_role.role_lambda_1.arn
  handler          = "1.handler"
  source_code_hash = data.archive_file.lambda_1_zip.output_base64sha256
  runtime          = "nodejs10.x"
}

resource "aws_lambda_function" "lambda_2" {
  filename = "2.zip"

  function_name    = "${var.environment}_mi_aguila_lambda_2"
  role             = aws_iam_role.role_lambda_2.arn
  handler          = "2.handler"
  source_code_hash = data.archive_file.lambda_2_zip.output_base64sha256
  runtime          = "nodejs10.x"
}

resource "aws_lambda_function" "lambda_3" {
  filename = "3.zip"

  function_name    = "${var.environment}_mi_aguila_lambda_3"
  role             = aws_iam_role.role_lambda_3.arn
  handler          = "3.handler"
  source_code_hash = data.archive_file.lambda_3_zip.output_base64sha256
  runtime          = "nodejs10.x"
}