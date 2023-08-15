resource "aws_s3_bucket" "log_bucket" {
  bucket = "${var.bucket_name}-log-bucket"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "${var.bucket_name}-log-bucket"
    Environment = "global-env"
  }
}

resource "aws_s3_bucket" "backups" {
  bucket = var.bucket_name

    policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudtrail.amazonaws.com"
      },
      "Action": "s3:GetBucketAcl",
      "Resource": "arn:aws:s3:::${var.bucket_name}"
    },
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudtrail.amazonaws.com"
      },
      "Action": "s3:PutObject",
      "Resource": "arn:aws:s3:::${var.bucket_name}/*",
      "Condition": {
        "StringEquals": {
          "s3:x-amz-acl": "bucket-owner-full-control"
        }
      }
    }
  ]
}
POLICY

  versioning {
    enabled = true
  }

  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "log/"
  }

  tags = {
    Name        = var.bucket_name
    Environment = "global-env"
  }
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.backups.bucket

  lambda_function {
    lambda_function_arn = var.lambda_arn
    events              = ["s3:ObjectCreated:*"]
    filter_suffix       = "/dev-cluster/grafana/grafana.db"
  }
}
