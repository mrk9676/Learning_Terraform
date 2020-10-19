terraform {
	backend "s3" {
		bucket		= "ntierbucket"
		key		= "global/ntier/terraform.tfstate"
		region		= "us-west-1"
		dynamodb_table 	= "mytableforstate"
	}
}
