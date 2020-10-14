resource "aws_vpc" "cus_vpc" {
	cidr_block = var.my_cidr
	tags = {
		Name = "My_custom_VPC"
	}
}

resource "aws_subnet" "subnets" {
	
	vpc_id = aws_vpc.cus_vpc.id
	count = length(var.my_tags)
	availability_zone = format("%s%s",var.my_region,var.my_az[count.index])	
	cidr_block = cidrsubnet(var.my_cidr,"8",count.index + 1)
	tags = {
		Name = var.my_tags[count.index]
	}
}
