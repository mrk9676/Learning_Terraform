variable "vpc_region" {
	type		= string
	default		= "us-west-1"
}
variable "vpc_cidr" {
	type		= string
	default		= "192.168.0.0/16"
}

variable "vpc_subnets" {
	type		= list(string)
	default		= ["web", "app", "db", "mgmt", "web2", "app2", "db2"]
}
