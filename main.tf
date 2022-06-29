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

# Create an IAM profile for the EC2 based on an existing role
resource "aws_iam_instance_profile" "server" {
  name = "EC2Server"
  role = "EC2Workshop"
}

# Create EC2 instance to be monitored by Fugue
resource "aws_instance" "server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  #iam_instance_profile = "${aws_iam_instance_profile.server.name}" # Uncomment to fix vulnerability
  tags = {
    Name = "ExampleFugueInstance-${random_id.server.hex}"
  }
}

