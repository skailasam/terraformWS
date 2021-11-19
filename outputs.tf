output "public_ip" {
  description = "Public IP Address"
  value = [for webserver in aws_instance.webserver : webserver.public_ip] 
}