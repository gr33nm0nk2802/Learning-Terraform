# Define the cloud provider. 
provider "aws" {
  region = "ap-south-1"
#   using a profile to avoid passing creds to the terraform file.  
  profile = "dev"
}

# Create a new VPC (Optional, if not using the default VPC)
resource "aws_vpc" "my-first-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-first-vpc"
  }
}

# Create a subnet within the VPC
resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my-first-vpc.id
  cidr_block = "10.0.1.0/24"  # Set the desired CIDR block within your VPC
  tags = {
    Name = "private-subnet-1"
  }
}

# Creating an EC2 Instance inside a VPC.
resource "aws_instance" "my-ec2-instace-name" {
  ami           = "ami-0287a05f0ef0e9d9a"            # hardcoded/use variables
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.my_subnet.id

  tags = {
    name = "Testing"
  }
}



