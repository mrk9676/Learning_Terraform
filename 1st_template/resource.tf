resource "aws_vpc" "myvpc" {
	cidr_block = var.vpc_cidr
	tags = {
		Name = "My_custom_VPC"
	}
}
resource "aws_subnet" "app" {
	vpc_id = aws_vpc.myvpc.id
	cidr_block = var.app_subnet
	tags = {
		Name = "app"
	}
}

resource "aws_subnet" "web" {
        vpc_id = aws_vpc.myvpc.id
        cidr_block = cidrsubnet("192.168.0.0/16",8,2)
        tags = {
                Name = "web"
        }
}

resource "aws_subnet" "db" {
        vpc_id = aws_vpc.myvpc.id
        cidr_block = "198.168.3.0/24"
        tags = {
                Name = "db"
        }
}

resource "aws_subnet" "mgmt" {
	vpc_id = aws_vpc.myvpc.id
	cidr_block = "198.168.4.0/24"
	tags = {
		Name = "mgmt"
	}
}
