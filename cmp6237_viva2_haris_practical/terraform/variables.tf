variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "eu-west-2"
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
  default     = "cmp6237-evolving-devops"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ssh_cidr" {
  description = "CIDR allowed to SSH (lock this down to your public IP/32)"
  type        = string
  default     = "0.0.0.0/0"
}

variable "http_cidr" {
  description = "CIDR allowed to reach HTTP"
  type        = string
  default     = "0.0.0.0/0"
}

variable "key_name" {
  description = "Existing AWS EC2 Key Pair name (create this in AWS first)"
  type        = string
}

variable "admin_username" {
  description = "Admin user to create on the server"
  type        = string
  default     = "devopsadmin"
}

variable "ubuntu_ami_owner" {
  description = "Canonical AMI owner ID"
  type        = string
  default     = "099720109477"
}

variable "ubuntu_ami_name" {
  description = "Ubuntu Server 22.04 LTS (Jammy) HVM SSD"
  type        = string
  default     = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
}
