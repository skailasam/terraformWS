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
variable "my_default_tags" {
  type = map(string)
  description = "Definition for default tags for resources"
  default = {
    automated_through = "Terraform"
    Terraform = true
  }
}
variable "instances" {
  type          = set(string)
  description   = "Describes the to be built Webservers"
  default       = ["Webserver1", "Webserver2"]
}