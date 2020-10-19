resource "aws_vpc" "my_vpc" {
		cidr_block		= var.vpc_cidr
		tags			= {
			Name		= "Ntier_VPC"
		}	
}

resource "aws_subnet" "subnets" {
		vpc_id			= aws_vpc.my_vpc.id
		count			= length(var.vpc_subnets)
		availability_zone       = format("%s%s",var.vpc_region,var.vpc_azs[count.index])
		cidr_block		= cidrsubnet(var.vpc_cidr,"8",count.index)
		tags			= {
			Name		= var.vpc_subnets[count.index]
		}
}

resource "aws_route_table" "route_table_names" {
		vpc_id                  = aws_vpc.my_vpc.id
		count			= length(var.vpc_routes)
		route			  {
			cidr_block	= "0.0.0.0/0"
			gateway_id 	= aws_internet_gateway.my_IGW.id
		}
		tags			= {
			Name		= var.vpc_routes[count.index]
		}
		depends_on		= [
			aws_internet_gateway.my_IGW ]
}


resource "aws_internet_gateway" "my_IGW" {
		vpc_id			= aws_vpc.my_vpc.id
		tags			= {
			Name		= "My_Ntier_IGW"
		
		
		}
		depends_on		= [
			aws_subnet.subnets ]
}
