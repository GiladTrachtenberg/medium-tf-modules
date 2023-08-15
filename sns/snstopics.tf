resource "aws_sns_topic_policy" "default" {
  arn    = aws_sns_topic.topic.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json
}

data "aws_iam_policy_document" "sns_topic_policy" {
  statement {
    actions   = ["SNS:Publish"]
    effect    = "Allow"
    resources = [aws_sns_topic.topic.arn]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

resource "aws_sns_topic" "topic" {
  name = var.backups_topic_name
}

resource "aws_sns_topic_subscription" "email_subscription" {
  for_each   = toset(var.email_addresses)
  topic_arn  = aws_sns_topic.topic.arn
  protocol   = "email"
  endpoint   = each.value
}

output "sns_topic_name" {
  value = aws_sns_topic.topic.arn
}