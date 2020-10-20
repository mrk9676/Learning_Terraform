resource "aws_security_group" "sg-for-rds" {
	name		= "Allow RDS"
	description 	= "Allow  RDS traffic"
	vpc_id      	= aws_vpc.my_vpc.id
	ingress     	  {
		description 	= "VPC to RDS"
		from_port	= local.rds_from_port
		to_port		= local.rds_to_port
		protocol	= local.rds_protocol
		cidr_blocks	= local.rds_cidr_blocks
	}
	egress		{
		cidr_blocks     = ["0.0.0.0/0"]
		from_port	= 0
		to_port		= 65535
		protocol	= local.rds_protocol
	}
	depends_on		= [
		aws_db_subnet_group.db_subnets ]
	tags			= {
		Name		= "My_RDS_SG"
	}
}
