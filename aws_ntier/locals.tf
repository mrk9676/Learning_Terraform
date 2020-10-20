
locals {
	group                   = ["db", "db2"]
	rds_to_port		= 3306
	rds_from_port		= 3306
	rds_protocol		= "tcp"
	rds_cidr_blocks		= [ "192.168.6.0/24" ,"192.168.2.0/24" ]
	rds_engine			= "mysql"
	rds_engine_version		= "8.0.20"
	db_name				= "My_Ntier_DB"
	rds_username			= "admin"
	rds_password			= "adminadmin"
	rds_instance_class		= "db.t2.micro"
	
	
}
