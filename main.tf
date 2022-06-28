# Define the terraform providers required
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

# Define AWS settings
provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

# Create a random ID for the EC2 instance name
resource "random_id" "server" {
  byte_length = 8
}

# Create EC2 instance to be monitored by Fugue
resource "aws_instance" "server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleFugueInstance-${random_id.server.hex}"
  }
}
