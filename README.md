# Terraform to AWS to Fugue Workshop

## Requirements

1. Have a Snyk AWS Account with access to ```us-west-2```
2. Create a free Fugue account <https://www.fugue.co/>
    - Use your Snyk email
3. Install and configure AWS CLI:
    - Install AWS CLI - [Mac download link](https://awscli.amazonaws.com/AWSCLIV2.pkg)
    - Run ```aws configure``` and follow the steps to add your ```AWS Access Key ID``` and ```AWS Secret Key``` and set the Default region name to ```us-west-2```, you can leave the output as default
    - If you can't find your AWS keys you can create new keys [as described by Amazon](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-prereqs.html)
    - Test with ```aws s3 ls```
4. Install and configure Terraform:
    - Install Terraform - Mac download link:
        - [Direct link Intel](https://releases.hashicorp.com/terraform/1.2.3/terraform_1.2.3_darwin_amd64.zip)
        - [Direct link ARM](https://releases.hashicorp.com/terraform/1.2.4/terraform_1.2.4_darwin_arm64.zip)
        - Using Brew
            - ```brew tap hashicorp/tap```
            - ```brew install hashicorp/tap/terraform```
    - Test with ```terraform -help```

## Step by step guide

1. Clone this repository ```git clone https://github.com/EricFernandezSnyk/terraform-aws-fugue-workshop.git```
2. Navigate to the repository ```cd terraform-aws-fugue-workshop```
3. Run ```terraform init```
    - **Optional**: Change the EC2 Name tag to your name
4. Run ```terraform plan```
5. Run ```terraform apply```
6. **Question time!**
7. Login to [AWS](https://aws.amazon.com/console/)
8. Navigate to EC2 and make sure your region is set to us-west-2
    - Alternatively, follow this link to [EC2 us-west-2](https://us-west-2.console.aws.amazon.com/ec2/v2/home?region=us-west-2#Instances:instanceState=running)
9. Find your EC2 instance with your unique ID and click on it
10. **Question time!**
11. Login to [Fugue](https://www.fugue.co)
12. Go to this view of [Fugue](https://riskmanager.fugue.co/environments/ae93aed4-06b3-4268-943f-e047994b1beb/compliance/resources?query=%5B%22resource_types%3AAWS.EC2.Instance%22%2C%22regions%3Aus-west-2%22%5D) to find all EC2 instances in ```us-west-2```. 
13. Find your instance and click on it!
14. **Question time!**
15. Snyk peek of what is coming :grin:
16. Extra time:
    - Fixing vulnerability [FG_R00253](https://riskmanager.fugue.co/rules/rules/list?query=%5B%22id%3AFG_R00253%22%5D)
    - Uncomment line 34 in ```main.tf```
    - Run ```terraform plan```
    - Run ```terraform apply```
    - Open [Fugue](https://riskmanager.fugue.co/environments/ae93aed4-06b3-4268-943f-e047994b1beb/compliance/resources?query=%5B%22resource_types%3AAWS.EC2.Instance%22%2C%22regions%3Aus-west-2%22%5D)
    - Verify that you fixed the vulnerability
17. We are done!
