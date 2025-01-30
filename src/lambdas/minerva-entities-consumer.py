import json

def handler(event, context):
  print("Queue processing started...")
  
  for message in event['Records']:
    process_message(message)

def process_message(message):
  try:
    data = json.loads(message['body'])
    timestamp = message['timestamp']
    message_id = message['messageId']
    
    print(f"Received message: {data}, timestamp: {timestamp}, message ID: {message_id}")

    entity = json.loads(data)
  except Exception as err:
    print(f"Error processing message: {message}")
    
    raise err