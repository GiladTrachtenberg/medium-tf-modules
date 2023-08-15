resource "aws_cloudwatch_metric_alarm" "file_update_alarm" {
  alarm_name          = "file_not_updated"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "FileUpdatedMetric"
  namespace           = "S3FileUpdate"
  period              = "86400"
  statistic           = "SampleCount"
  threshold           = "1"
  alarm_description   = "This metric checks if the file has been updated in the last 24 hours"
  alarm_actions       = [var.backups_topic_name]
}

