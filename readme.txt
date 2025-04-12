#Scenario
Payroll Application Deployment
Ironhack has developed a Payroll application that must be deployed in multiple countries. Although each country requires its own dedicated infrastructure, the overall architecture remains the same. By building a custom Terraform module, you will deploy the following components:

An EC2 instance running a custom AMI with the application server.
A DynamoDB table for storing employee financial records.
An S3 bucket for tax documents and other payroll-related files.
The deployment will use AWS’s default VPC and subnets, keeping the architecture simple while demonstrating modularity.



#Project Structure
ironhack-terraform-modules-lab/
├── modules/
│   └── vpc/
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── main.tf
├── outputs.tf
├── variables.tf
└── README.md

#Scalability
To deploy the infrastructure in a different AWS region:
Create a New Configuration File
For example, to deploy in the EU (Frankfurt) region, create eu.tf with the following content:

module "vpc" {
  source     = "./modules/vpc"
  aws_region = "eu-central-1"
  # Add other variable overrides as needed
}