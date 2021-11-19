output "public_ip" {
  description = "Public IP Address"
  value       = [for webserver in aws_instance.webserver : webserver.public_ip]
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value = module.vpc.public_subnets
}


output "vpc_id" {
  description = "VPC ID"
  value = module.vpc.vpc_id
}