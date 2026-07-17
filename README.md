# Terraform AWS 2-Tier Infrastructure Project

## Overview

This project provisions a highly available **2-tier application infrastructure on AWS** using **Terraform** and follows Infrastructure as Code (IaC) best practices.

The infrastructure includes:

* Custom VPC
* Public and Private Subnets across multiple Availability Zones
* Internet Gateway and NAT Gateway
* EC2 instances managed by Auto Scaling Group (ASG)
* Security Groups
* S3 Bucket
* Remote State Management using Amazon S3 with Native State Locking
* Terraform Tests
* Security Scanning with Trivy
* Cost Estimation with Infracost
* CI/CD using GitHub Actions

---

# Architecture

```text
                            Internet
                                |
                        Internet Gateway
                                |
                ---------------------------------
                |                               |
         Public Subnet A                 Public Subnet B
                |                               |
                ---------------------------------
                                |
                         Auto Scaling Group
                                |
                ---------------------------------
                |                               |
        Private Subnet A                Private Subnet B
                |                               |
              EC2 Instance                 EC2 Instance
                                |
                           Amazon S3
```

---

# Project Structure

```text
terraform-2tier-app/
│
├── README.md
├── backend.tf
├── providers.tf
├── versions.tf
├── variables.tf
├── terraform.tfvars
├── main.tf
├── outputs.tf
├── data.tf
├── locals.tf
│
├── user-data/
│   └── install.sh
│
├── modules/
│   └── security-group/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── tests/
│   └── vpc.tftest.hcl
│
├── .github/
│   └── workflows/
│       ├── terraform.yml
│       └── terraform-cd.yml
│
└── infracost.yml
```

---

# Features Implemented

## Networking

* Custom VPC
* Public Subnets
* Private Subnets
* Internet Gateway
* NAT Gateway
* Route Tables

---

## Compute

* Launch Template
* Auto Scaling Group
* Amazon Linux 2023 AMI
* EC2 Bootstrap using User Data

---

## Security

* Custom Security Group Module
* Restricted SSH Access
* HTTP Access
* Security Scan using Trivy
* S3 Encryption
* S3 Versioning
* Public Access Block

---

## Storage

* Amazon S3 Bucket
* Versioning Enabled
* Encryption Enabled

---

# Terraform Requirements Covered

## Custom Module

Implemented:

```text
modules/security-group
```

---

## Registry Module

Implemented:

```text
terraform-aws-modules/vpc/aws
```

---

## Remote State Management

* Backend: Amazon S3
* State Locking: Native S3 Lock File
* State File Versioning Enabled

---

## Variables and Outputs

### Variables

* AWS Region
* VPC CIDR
* Subnets
* Instance Type
* Auto Scaling Configuration
* Project Name
* Developer IP

### Outputs

* VPC ID
* Public Subnet IDs
* Private Subnet IDs
* S3 Bucket Name

---

# Security Scanning

Run:

```bash
trivy config .
```

Scans:

* Terraform Misconfigurations
* Insecure Security Groups
* Missing Encryption
* Public Access Issues

---

# Terraform Testing

Run:

```bash
terraform test
```

Tests include:

* VPC Validation
* Variable Validation
* Infrastructure Assertions

---

# Cost Estimation

Run:

```bash
terraform plan -out=tfplan

infracost breakdown \
--path=tfplan
```

Estimated monthly cost:

| Resource      | Approx Cost |
| ------------- | ----------- |
| NAT Gateway   | ~$32        |
| EC2 t2.micro  | ~$8         |
| S3            | <$1         |
| Data Transfer | ~$2         |
| Total         | ~$42/month  |

---

# CI Pipeline

GitHub Actions CI performs:

* Terraform Init
* Terraform Format Check
* Terraform Validation
* Terraform Tests
* Trivy Security Scan
* Terraform Plan
* Infracost Cost Estimation

---

# CD Pipeline

The CD pipeline is triggered only after successful completion of the CI pipeline.

Performs:

* Terraform Init
* Terraform Apply
* Environment Approval (optional)

---

# Prerequisites

* Terraform >= 1.10
* AWS CLI configured
* Git
* Trivy
* Infracost

---

# Setup Instructions

## Clone Repository

```bash
git clone https://github.com/<username>/terraform-2tier-app.git

cd terraform-2tier-app
```

---

## Initialize Terraform

```bash
terraform init
```

---

## Format Code

```bash
terraform fmt -recursive
```

---

## Validate Configuration

```bash
terraform validate
```

---

## Run Tests

```bash
terraform test
```

---

## Run Security Scan

```bash
trivy config .
```

---

## Generate Cost Estimate

```bash
terraform plan -out=tfplan

infracost breakdown \
--path=tfplan
```

---

## Review Execution Plan

```bash
terraform plan
```

---

## Deploy Infrastructure

```bash
terraform apply
```

---

## Destroy Infrastructure

```bash
terraform destroy
```

---

# GitHub Secrets Required

Add the following repository secrets:

```text
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
INFRACOST_API_KEY
```

---

# AWS Services Used

* Amazon VPC
* Amazon EC2
* Auto Scaling
* Amazon S3
* IAM
* Route Tables
* Internet Gateway
* NAT Gateway

---

# Learning Outcomes

* Infrastructure as Code (IaC)
* Modular Terraform Design
* Remote State Management
* Terraform Testing
* Security Scanning
* Cost Optimization
* CI/CD Automation
* AWS Networking
* Terraform Best Practices

---

# Cleanup

Destroy all resources:

```bash
terraform destroy -auto-approve
```

Verify:

* No EC2 Instances
* No VPC Resources
* No NAT Gateway Charges
* No Unused Elastic IPs

---

# Author

**Sakshi Saxena**

Senior Software Engineer | DevOps & Cloud Enthusiast

AWS | Terraform | Docker | Kubernetes | CI/CD | Linux | GitHub Actions
