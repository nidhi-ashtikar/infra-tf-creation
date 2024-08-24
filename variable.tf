

variable "instance_name" {
  description = "The name of the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The type of the EC2 instance"
  type        = string
}

variable "root_volume_size" {
  description = "The size of the root volume in GB"
  type        = number
}

variable "userdata_script" {
  description = "User data script to configure the instance"
  type        = string
}
