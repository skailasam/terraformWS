output "public_ip" {
  value = module.test-webserver.public_ip
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value = module.vpc.public_subnets
}


output "vpc_id" {
  description = "VPC ID"
  value = module.vpc.vpc_id
}