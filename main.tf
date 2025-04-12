module "payroll" {
  source              = "./modules/payroll"
  ami_id              = "ami-01ff9fc7721895c6b"  # Ensure this AMI is valid for your region
  instance_type       = "t2.micro"
  s3_bucket_name      = "other-romain-payroll-docs-ap-northeast-1"
  dynamodb_table_name = "romain-PayrollDB"
  providers = {
    aws = aws.eu_west_1
  }
}

module "payroll_europe" {
  source              = "./modules/payroll"
  ami_id              = "ami-0ecf75a98fe8519d7"
  instance_type       = "t2.micro"
  s3_bucket_name      = "other-romain-payroll-docs-eu-west-1"
  dynamodb_table_name = "romain-PayrollDB-EU"
  providers = {
    aws = aws.eu_central_1
  }
}
    
# Provider for eu-central-1
provider "aws" {
  alias  = "eu_central_1"
  region = "eu-central-1"
}

# Provider for eu-west-1
provider "aws" {
  alias  = "eu_west_1"
  region = "eu-west-1"
}

