variable "vpc_cidr" {
	type = string
	default = "192.168.0.0/16"
	description = "Defining vpc_cidr variable"
}
variable "app_subnet" {
	type = string
	default = "192.168.1.0/16"
	description = "Defining app_subnet variable"
}
	
