variable "my_cidr" {
	type = string
	default = "192.168.0.0/16"
	description = "This is  cidr variable"
}
variable "my_region" {
	type = string
	default = "us-east-1"
	description = "Region variable"
}
variable "my_az" {
	type = list(string)
	default = ["a", "b", "c", "a"] 
	description = "AZ variable"
}

variable "my_tags" {
	type = list(string)
	default = ["app","web","db","mgmt"]
	description = "tag variable"
}

