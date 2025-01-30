echo "Ziping consumer Lambda source code..."

zip ../../src/lambdas/minerva-entities-consumer.zip minerva-entities-consumer.py

echo "Creating consumer Lambda function..."

awslocal lambda create-function \
    --function-name minerva-entities-consumer \
    --zip-file fileb://minerva-entities-consumer.zip \
    --handler minerva-entities-consumer.handler \
    --runtime python3.9 \
    --role arn:aws:iam::000000000000:role/lambda-execution-role

echo "Setting up event source mapping for consumer Lambda..."

awslocal lambda create-event-source-mapping \
  --function-name minerva-entities-consumer \
  --event-source-arn arn:aws:sqs:us-east-1:000000000000:minerva-entities \
  --batch-size 10 \
  --visibility-timeout 60