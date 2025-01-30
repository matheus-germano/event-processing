set -e

echo "Starting infrastructure setup..."

bash infra/setup-aws.sh
bash infra/dynamodb/create-file-processing-dynamodb.sh
bash infra/sqs/create-minerva-entities-sqs.sh
bash infra/s3/create-minerva-entities-s3-bucket.sh
# bash infra/lambda/create-producer-lambda.sh
# bash infra/lambda/create-consumer-lambda.sh

echo "Infrastructure setup complete!"