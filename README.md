📄 Description
This project provisions a complete 3-tier architecture on AWS using Terraform. It automates the creation of a secure and scalable infrastructure consisting of a web tier, application tier, and database tier, each placed in appropriate subnets with controlled access.

✨ Features
Custom VPC with public and private subnets

Web servers deployed in public subnets

Application servers deployed in private subnets

Amazon RDS database instance in isolated private subnets

Security groups configured for each layer to control traffic flow

Highly modular and reusable Terraform code

⚙️ Requirements
An AWS account

Terraform installed locally

AWS CLI installed and configured (aws configure)

🚀 How to Use
Clone the repository
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
terraform init: Initializes your working directory and downloads required providers.

terraform validate: Checks .tf files for syntax errors and correct configurations.

terraform apply: Creates or updates infrastructure as described in your code.

Shows a detailed execution plan before making changes.

Prompts for approval (you type yes) before applying.

Used to deploy, modify, or destroy real cloud resources.

terraform destroy to delete all the resource.
