module "test-webserver" {
  source = "./modules/webserver"

  subnet_id = module.vpc.public_subnets[0]
  vpc_id = module.vpc.vpc_id

  instance_type = var.instance_type
}

#resource "aws_eip" "example" {
#  instance = aws_instance.webserver.id
#}

