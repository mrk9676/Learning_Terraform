variable "vpc_region" {
	type		= string
	default		= "us-east-1"
}
variable "vpc_cidr" {
	type		= string
	default		= "192.168.0.0/16"
}

variable "vpc_subnets" {
	type		= list(string)
	default		= ["web", "app", "db", "mgmt", "web2", "app2", "db2"]
}
variable "vpc_azs" {
	type		= list(string)
	default		= [ "a", "b", "c", "d", "e", "f", "a" ]
}
variable "vpc_routes" {
	type		= list(string)
	default		= [ "public", "private" ]
}
variable "pub_subnet_associations" {
	type		= list
	default		= [0,3,4]

}
variable "pvt_ubnet_associations" {
	type		= list
	default		= [1,2,5,6]
	
}
