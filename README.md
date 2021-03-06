# cloudformation-minecraft-bedrock

## Get AWS CLI
MacOS
Download and run the MacOS PKG installer from hhttps://awscli.amazonaws.com/AWSCLIV2.pkg
```
Continue, Continue, Continue ... install
```

Windows

Download and run the 64-bit Windows installer from https://awscli.amazonaws.com/AWSCLIV2.msi
```
next, next next ... install
```

Linux
```
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
```
## Create an IAM user with access key to use CLI later.
Configure your AWS CLI with your new IAM user's access keys.
```
aws configure
```

## Recipe
Go to folder that you would like to use as your source folder.
Get the AWS CloudFormation recipe:
```
git clone https://github.com/noobtron/cloudformation-minecraft-bedrock.git
```

## MacOS Run recipe in terminal
Run automatemacos.sh fetched from git
```
    cd cloudformation-minecraft-bedrock
    chmod +x automatemacos.sh
    ./automatemacos.sh
```


## Windows Run recipe powershell
Run automatewin.ps1 fetched from git
```
    cd cloudformation-minecraft-bedrock
    automatewin.ps1
```

automate.ps1 does the following, 1 gets your public ip-address, creates a new key pair for SSH access, deploys the cloudformation stack:
```
    $ip = (Invoke-WebRequest ifconfig.me/ip).Content.Trim()
    aws ec2 create-key-pair --key-name mb-key --query 'KeyMaterial' --output text | out-file -encoding ascii -filepath mbkey.pem
    aws cloudformation create-stack --stack-name minecraft-bedrock-server --template-body file://cf-main.yaml --parameters ParameterKey=WorkstationIp,ParameterValue=$ip ParameterKey=Key,ParameterValue=mb-key
```