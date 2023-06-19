# AWS 3-Tier Architecture with Terraform

![2-tier](https://github.com/realexcel2021/3-tier-Architecture-design/assets/89150996/9684c9af-e524-4bc3-906a-e35fc75e3c83)

<p> :heavy_check_mark: 1 Load Balancer  </p>
<p> :heavy_check_mark: 2 EC2 Instances </p>
<p> :heavy_check_mark: Security Groups </p>
<p> :heavy_check_mark: RDS MySQL DataBase </p>
<p> :heavy_check_mark: 3 Route Tables </p>
<p> :heavy_check_mark: VPC </p>
<p> :heavy_check_mark: 9 Subnets for High availability </p>
<p> :heavy_check_mark: 1 NAT Gateway </p>
<p> :heavy_check_mark: 1 Internet Gateway </p>
<p> :heavy_check_mark: US-EAST-1 </p>

  This repository contains Terraform code for deploying a 3-tier architecture on AWS. The architecture consists of a web tier with a load balancer, an application tier with EC2 instances, and a data tier with a MySQL database deployed on RDS. The infrastructure is designed to be deployed in the us-east-1 region. You can use autoscaling feature in the auto scaling branch


## Prerequisites 
To use this terraform code, you need to have the following prerequisites:
1. [Terraform ]("https://www.terraform.io/downloads.html") Installed on your machine 
2. AWS account credentials with appropriate permissions to provision resources. 

## Getting Started 
Follow the steps below to get started with this infrastructure as code using Terraform:

1. Clone this repository to your local machine:
`git clone https://github.com/realexcel2021/3-tier-Architecture-design`
2. Change to the cloned directory `cd ~/3-tier-Architecture-design`
3. Initialize Terraform by running the following command: `terraform init`
4. Run terraform plan to preview the changes that will be applied: `terraform plan`
5. If the plan looks good, you can apply the changes to provision the infrastructure: `terraform apply`
6. After the Terraform apply completes successfully, it will display the output variables containing information about the provisioned resources.

## Architecture Overview
This infrastructure provisions the following resources in the us-east-1 region:

1. Web/Presentation Tier:
   - Elastic Load Balancer (ELB) - Acts as the entry point for end users.
2. Application Tier:
   - EC2 Instances - Deployed across multiple availability zones in private subnets.
3. Data Tier:
   - Amazon RDS - MySQL database deployed on RDS, utilizing a subnet group with 3 private subnets across multiple availability zones.

## Cleaning Up
To clean up and delete the provisioned resources, run the following command:
`terraform destroy`
This will destroy all the resources created by Terraform. Please note that this action is irreversible and will permanently delete the resources.

## Conclusion
By using this Terraform code, you can easily provision a 3-tier architecture on AWS with a web tier, application tier, and data tier. Feel free to explore and modify the code to fit your specific needs. If you have any questions or issues, please don't hesitate to Reach out to me on Twitter.

Happy coding!

