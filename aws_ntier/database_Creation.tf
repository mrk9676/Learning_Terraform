resource "aws_db_subnet_group" "db_subnets" {
                name                    = "ntierdbgroup"
                subnet_ids              = data.aws_subnet_ids.selected.ids
                tags                    = {
                        Name            = "Ntier-db-group"

                }
}
resource "aws_db_instance" "my_rds_instance" {
	allocated_storage		= 20
	instance_class			= local.rds_instance_class
	allow_major_version_upgrade	= false
	db_subnet_group_name		= "ntierdbgroup"
	engine 				= local.rds_engine
	engine_version			= local.rds_engine_version
	name				= local.db_name
	username			= local.rds_username
	password			= local.rds_password
	port				= local.rds_to_port
	publicly_accessible		= false
	vpc_security_group_ids		= [ aws_security_group.sg-for-rds.id ]
	tags				= {
			Name		= "My_Ntier_DB_Instance"
	}
	depends_on			= [
		aws_db_subnet_group.db_subnets,
		aws_security_group.sg-for-rds ]
		
}
	
