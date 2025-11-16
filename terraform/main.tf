resource "aws_instance" "web" {
  ami           = "ami-0c1c30571d2dae5c9"
  instance_type = var.instance_type

  tags = {
    Name = "devops-automation"
  }
}
