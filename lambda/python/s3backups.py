import json
import boto3
import os

def lambda_handler(event, context):
    client = boto3.client('cloudwatch')
    
    response = client.put_metric_data(
        Namespace='S3FileUpdate',
        MetricData=[
            {
                'MetricName': 'FileUpdatedMetric',
                'Value': 1,
                'Unit': 'None'
            },
        ]
    )
    return {
        'statusCode': 200,
        'body': json.dumps('Metric Updated Successfully!')
    }
