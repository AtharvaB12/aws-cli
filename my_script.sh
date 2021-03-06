#/bin/bash
SEC_ID=`aws ec2 create-security-group --group-name sec_group_01 --description "Default Security Group" --vpc-id vpc-6664411c --output text`
echo $SEC_ID
aws ec2 authorize-security-group-ingress --group-name sec_group_01 --ip-permissions IpProtocol=tcp,FromPort=22,ToPort=22,IpRanges=[{CidrIp=0.0.0.0/0}] IpProtocol=tcp,FromPort=80,ToPort=80,IpRanges=[{CidrIp=0.0.0.0/0}]
New=`aws ec2 run-instances --image-id ami-09d069a04349dc3cb --count 1 --instance-type t2.micro --key-name aws_key --security-group-ids=$SEC_ID  --placement AvailabilityZone=us-east-1a  --block-device-mappings DeviceName=/dev/xvda,Ebs={VolumeSize=10}`
echo $New
