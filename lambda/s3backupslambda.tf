data "archive_file" "s3-backups-lambda-file" {
  type = "zip"
  source_file = "../terraform-modules/lambda/python/${var.codefile_name}.py"
  output_path = "../terraform-modules/lambda/python/${var.zipfile_name}.zip"
}

resource "aws_lambda_function" "file_update_lambda" {
  filename      = data.archive_file.s3-backups-lambda-file.output_path
  function_name = var.function_name
  role          = var.role_name
  handler       = "lambda_function.lambda_handler"
  source_code_hash = data.archive_file.s3-backups-lambda-file.output_base64sha256
  runtime       = "python3.8"
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.file_update_lambda.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::telemessage-backups"
}
