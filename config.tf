
provider "aws" {
  region = var.region  # Replace with your desired region
}

module "ec2_instance" {
  source = "git::https://github.com/nidhi-ashtikar/infra-tf-modules.git//ec2"  # Adjust the path if your module is in a different directory
  instance_type = var.instance_type
  port = "22"
  protocol = "tcp"
  instance_name = var.instance_name
  
  
  }



