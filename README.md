DevOps-course-STEP-2023
=======================

Show security groups (SG) all data:
```bash
aws ec2 describe-security-groups
```

Show security groups (SG) for EC2 with a query:
```bash
aws ec2 describe-security-groups --query "SecurityGroups[*].{GroupName:GroupName,GroupId:GroupId}"
```

Create a security group
```bash
aws ec2 create-security-group --group-name diana-security-group --description "diana-security-group" --vpc-id vpc-049b2304cf4989ee2
```

Configure security group inbound rules
```bash
aws ec2 authorize-security-group-ingress --group-id sgID --protocol tcp --port 8111
```
