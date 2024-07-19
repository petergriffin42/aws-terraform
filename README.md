AWS Infrastructure as Code assignment

Using Terraform, create the following resources:
• VPC with two public and private subnets

  - Made a local list in subnets.tf. The public & private subnet resources iterate through this list depending on their type with optional name & az variables

• Route Tables for each subnet

  - Private subnets will be left on the default route table. Any public subnets will have a public route table association pointing it to the public route table

• Security Group to allow port 80 and 443 from the internet

  - Created an allow 80 & allow 443 security group. Pointed them at the public subnet blocks.

• ELB – Listening on ports 80 & 443

  - Created an ELB. Assigned it the security groups and the public subnets. Thought this was working but running my Terraform apply and it looks to have circular logic where its waiting for the DNS record to be created to validate the certificate however that DNS record is waiting for the ELB to be created. Didn't have time to fix this.

• Public route53 hosted zone and CNAME entry for the ELB

  - Created a griffin-resume.com zone. Pointed a CNAME elb.griffin-resume.com to the ELB A record.


AWS API
Create a script using any preferred programming language (preferably, PowerShell/Python) to perform the following activities:
• List all AWS Resources being used in the account, per region

  - Found Python has a boto3 to make API requests to AWS. First I got a list of regions, then looped through the resourcegroupstaggingapi for resources in each region. Set it so it will only list regions that have resources and output those.

• List each resource in detail (EC2, RDS etc)

  - Did not finish this. Utilizing boto3 it appears that each resource can have its own kind of request to find the details. Found some examples online that I could have copied and pasted but decided to leave it as is.