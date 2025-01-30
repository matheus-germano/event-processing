##### Setup paths in bash scripts
###### AWS CLI
- choco install awscli
- echo 'export PATH="$PATH:/C/Program Files/Amazon/AWSCLIV2/bin"' >> ~/.bashrc
- source ~/.bashrc

###### AWS CLI LocalStack
- pip install awscli-local
- echo 'export PATH="$PATH:/%USER%/AppData/Roaming/Python/Python312/Scripts"' >> ~/.bashrc
- source ~/.bashrc