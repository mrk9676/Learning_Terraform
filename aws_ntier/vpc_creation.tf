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


resource "aws_route_table_association" "public_association" {
		count			= length(var.pub_subnet_associations)
		subnet_id		= aws_subnet.subnets[var.pub_subnet_associations[count.index]].id
		route_table_id 		= aws_route_table.route_table_names[0].id
}
resource "aws_route_table_association" "pvt_association" {
		count			= length(var.pvt_ubnet_associations)
		subnet_id		= aws_subnet.subnets[var.pvt_ubnet_associations[count.index]].id
		route_table_id		= aws_route_table.route_table_names[1].id
}

data "aws_subnet_ids" "selected" {
		vpc_id                  = aws_vpc.my_vpc.id
		filter  {
			name		= "tag:Name"
			values		= local.group
		}
}

resource "aws_db_subnet_group" "db_subnets" {
		name			= "ntierdbgroup"
		subnet_ids     		= data.aws_subnet_ids.selected.ids
		tags			= {
			Name		= "Ntier-db-group"
		
		}
		

		
}












