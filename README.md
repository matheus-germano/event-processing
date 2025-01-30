### Setup AWS CLI
###### AWS CLI
```bash
choco install awscli # Install AWS CLI
```

```bash
echo 'export PATH="$PATH:/C/Program Files/Amazon/AWSCLIV2/bin"' >> ~/.bashrc # Add AWS CLI path to bashrc
```

```bash
source ~/.bashrc # Reload bashrc
```

###### AWS CLI LocalStack
```bash
pip install awscli-local # Install AWS CLI LocalStack
```

```bash
echo 'export PATH="$PATH:/%USER%/AppData/Roaming/Python/Python312/Scripts"' >> ~/.bashrc # Add AWS CLI LocalStack path to bashrc
```

```bash
source ~/.bashrc # Reload bashrc
```

### Docker management
```bash
docker-compose up -d # Start docker container
```

```bash
docker-compose down -v # Clear docker container (remove it)
```

### AWS Services
```bash
bash ./aws.sh # Create AWS Services in LocalStack instance
```