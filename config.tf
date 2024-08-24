
module "ec2" {
  source = "git::https://github.com/nidhi-ashtikar/infra-tf-modules/main/ec2/"

  instance_type = "t2.micro"

}


