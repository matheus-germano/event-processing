echo "Creating WorldCheck file processing table..."

awslocal dynamodb create-table \
  --table-name world-check-file-processing \
  --attribute-definitions \
    AttributeName=Id,AttributeType=S \
  --key-schema \
    AttributeName=Id,KeyType=HASH \
  --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
  --stream-specification StreamEnabled=true,StreamViewType=NEW_IMAGE