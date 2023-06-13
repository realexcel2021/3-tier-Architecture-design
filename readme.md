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

<p>
  This repository contains Terraform code for deploying a 3-tier architecture on AWS. The architecture consists of a web tier with a load balancer, an application tier with EC2 instances, and a data tier with a MySQL database deployed on RDS. The infrastructure is designed to be deployed in the us-east-1 region.
</p>

<h2> Prerequisites </h2>
To use this terraform code, you need to have the following prerequisites:
<p>1. <a href="https://www.terraform.io/downloads.html"> Terraform </a> Installed on your machine </p>
<p> 2. AWS account credentials with appropriate permissions to provision resources. </p>

<h2> Getting Started </h2>
<p> Follow the steps below to get started with this infrastructure as code using Terraform: </p>

<p> 1. Clone this repository to your local machine:
` git clone https://github.com/realexcel2021/3-tier-Architecture-design `
</p>
