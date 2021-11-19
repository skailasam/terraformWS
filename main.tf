provider "aws" {
  profile  = "terraformWS"
  region   = "eu-central-1"
  default_tags {
    tags = var.my_default_tags
  }
}

resource "aws_instance" "webserver" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.web.id]
  tags = merge(local.tags, local.customer, tomap({ Name = "Michis Webserver"})) 
  user_data = templatefile("user_data.sh", {username = var.username})
}
resource "aws_security_group" "web" {
  name_prefix = "web-access"
  description = "Allow access to the server from the web"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1" # Erlaubt jede Ausgehende Protocols 
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = local.tags
}

variable "instance_type" {
  type = string
  description = "Instance type for the web server."
  default = "t2.nano"
}
variable "username" {
  type = string
  description = "value"
  default = "BraucheName"
}

output "public_ip" {
  description = "Public IP Address"
  value = aws_instance.webserver.public_ip
}

locals {
  tags = {
    Projekt = "TecRacccceeer"
    Owner = "Enterprise"
  }
  customer = { Name = "CustomerName"}
}

variable "my_default_tags" {
  type = map(string)
  description = "Definition for default tags for resources"
  default = {
    automated_through = "Terraform"
    Terraform = true
  }
}

data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "name"
    values = ["amzn2-ami-hvm-2.0.*-x86_64-gp2"]
  }
}