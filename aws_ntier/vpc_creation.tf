resource "aws_vpc" "my_vpc" {
		cidr_block	= var.vpc_cidr
		tags		= {
			Name	= "Ntier_VPC"
		}	
}

resource "aws_subnet" "subnets" {
		vpc_id		= aws_vpc.my_vpc.id
		count		= length(var.vpc_subnets)
		cidr_block	= cidrsubnet(var.vpc_cidr,"8",count.index)
		tags		= {
			Name	= var.vpc_subnets[count.index]
		}
}
	
