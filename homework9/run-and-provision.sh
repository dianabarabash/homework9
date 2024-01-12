#!/usr/bin/env bash

aws ec2 run-instances \
  --image-id ami-053b0d53c279acc90 \
  --count 1 \
  --instance-type t2.micro \
  --key-name diana-key-pair \
  --security-group-ids sg-0f66005c2de143512 \
  --subnet-id subnet-03e8a106447fa4c99 \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=homework-9}]' \
  --user-data file://user-data.sh
