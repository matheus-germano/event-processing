import json
import boto3
import os

sqs = boto3.client(
    'sqs',
    endpoint_url='http://localhost:4566',
    region_name='us-east-1'
)

QUEUE_URL = 'http://sqs.us-east-1.localhost.localstack.cloud:4566/000000000000/minerva-entities'
START_FILE_PROCESSING_TYPE = 'Created'

def handler(event, context):
    print("DynamoDB Event:", json.dumps(event, indent=2))

    for record in event['Records']:
        item_id = record['dynamodb']['NewImage']['Id']['S']
        file_processing_type = record['dynamodb']['NewImage']['ProcessingType']['S']
        world_check_file_type = record['dynamodb']['NewImage']['WorldCheckType']['S']

        if file_processing_type == START_FILE_PROCESSING_TYPE:
          print(f"File {item_id} processing started...")

          process_world_check_file(world_check_file_type)

def process_world_check_file(file_type):
  print(f"Processing {file_type} World Check file...")

def publish_entity(entity):
  message_body = json.dumps(entity)

  response = sqs.send_message(
    QueueUrl=QUEUE_URL,
    MessageBody=message_body
  )

  print("Sent entity to SQS:", response)