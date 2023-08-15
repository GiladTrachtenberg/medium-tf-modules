# AWS Infrastructure as Code using Terragrunt

This repository contains a collection of Terraform scripts managed with Terragrunt, which can be used to provision various resources in the Amazon Web Services (AWS) ecosystem. The scripts are organized into folders, each representing a specific component of the AWS infrastructure.

## Directory Structure

* `eks`: Contains Terraform scripts to create an Amazon Elastic Kubernetes Service (EKS) cluster, Node IAM roles, EKS nodes, IRSA (IAM Roles for Service Accounts), and output configurations.
* `kubernetes-addons`: Contains Terraform scripts for Kubernetes add-ons like the cluster autoscaler.
* `s3`: Contains Terraform scripts to set up an Amazon Simple Storage Service (S3) bucket for backups.
* `vpc`: Contains Terraform scripts to create an Amazon Virtual Private Cloud (VPC), Internet Gateway (IGW), Subnets, NAT Gateways, Route Tables and output configurations.
* `cloudtrail`: Contains Terraform scripts to create an Amazon CloudTrail for the S3 buckets used for backups.

## Usage

Each of the directories eks, kubernetes-addons, s3, and vpc can be navigated into and contain its own Terraform files (.tf) that are used to provision that particular component.

To use these scripts, navigate into the directory of the component you wish to create and run the following commands:

```
# Initialize and apply Terraform configuration using Terragrunt
terragrunt run-all init
terragrunt run-all plan
terragrunt run-all apply
```

Note that the apply command will prompt you for confirmation before making any changes to your infrastructure.

Ensure that you have the necessary permissions on AWS to create and manage the respective resources.
