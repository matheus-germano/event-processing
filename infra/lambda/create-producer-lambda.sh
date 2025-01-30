echo "Ziping producer Lambda source code..."

zip ../../src/minerva-entities-producer.zip minerva-entities-producer.py

echo "Creating producer Lambda function..."

awslocal lambda create-function \
    --function-name minerva-entities-producer \
    --zip-file fileb://minerva-entities-producer.zip \
    --handler minerva-entities-producer.handler \
    --runtime python3.9 \
    --role arn:aws:iam::000000000000:role/lambda-execution-role

echo "Setting up event source mapping for producer Lambda..."

awslocal lambda create-event-source-mapping \
  --function-name minerva-entities-producer \
  --event-source-arn arn:aws:dynamodb:us-east-1:000000000000:table/world-check-file-processing/stream/2025-01-30T02:53:25.984 \
  --starting-position LATEST