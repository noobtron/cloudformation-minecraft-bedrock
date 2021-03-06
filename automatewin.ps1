$ip = (Invoke-WebRequest ifconfig.me/ip).Content.Trim()
aws ec2 create-key-pair --key-name mb-key --query 'KeyMaterial' --output text | out-file -encoding ascii -filepath mbkey.pem
aws cloudformation create-stack --stack-name minecraft-bedrock-server --template-body file://cf-main.yaml --parameters ParameterKey=WorkstationIp,ParameterValue=$ip ParameterKey=Key,ParameterValue=mb-key