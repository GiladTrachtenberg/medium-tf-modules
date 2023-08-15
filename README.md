# AWS Infrastructure as Code using Terraform

This repository contains a collection of Terraform scripts deployed with Terragrunt, which can be used to provision various resources in the Amazon Web Services (AWS) ecosystem. The scripts are organized into folders, each representing a specific component of the AWS infrastructure.

## Directory Structure

* `iam`: Contains Terraform scripts to create an Amazon IAM role.
* `cloudwatch`: Contains Terraform scripts for Amazon CloudWatch.
* `s3`: Contains Terraform scripts to set up an Amazon Simple Storage Service (S3) bucket for backups.
* `sns`: Contains Terraform scripts to create an Amazon Simple Notification Service (SNS).
* `lambda`: Contains Terraform scripts to create an Amazon Lambda for the S3 buckets used for backups.

## Usage

Each of the directories can be navigated into and contain its own Terraform files (.tf) that are used to provision that particular component.

Ensure that you have the necessary permissions on AWS to create and manage the respective resources.
