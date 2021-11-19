resource "aws_instance" "webserver" {
  for_each = var.instances
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.web.id]
  tags = merge(local.tags, local.customer, tomap({ Name = "Michis Webserver"})) 
  user_data = templatefile("./templates/user_data.sh", {username = var.username})
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




#resource "aws_eip" "example" {
#  instance = aws_instance.webserver.id
#}

