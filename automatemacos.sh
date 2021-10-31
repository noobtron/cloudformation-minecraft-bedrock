ip="$(curl ifconfig.me)"
aws ec2 create-key-pair --key-name mb-key --query 'KeyMaterial' --output text > mbkey.pem
aws cloudformation create-stack --stack-name minecraft-bedrock-server --template-body file://cf-main.yaml --parameters ParameterKey=WorkstationIp,ParameterValue=$ip ParameterKey=Key,ParameterValue=mb-key