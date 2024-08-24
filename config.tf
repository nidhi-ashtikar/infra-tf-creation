
provider "aws" {
  region = "us-east-1"  # Replace with your desired region
}

module "ec2_instance" {
  source = "git::https://github.com/nidhi-ashtikar/infra-tf-modules.git//ec2"  # Adjust the path if your module is in a different directory
  instance_type = "t2.micro"

}


module "security_group" {
  source = "git::https://github.com/nidhi-ashtikar/infra-tf-modules/blob/main/ec2/security_group.tf"
  port = "22"
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}