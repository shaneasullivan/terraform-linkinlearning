#resource "google_compute_network" "our_dev_network" {
#	name = "devnetwork"
#	auto_create_subnetworks = true
#}

resource "aws_vpc" "enviornment-example-two"{
	cidr_block = "10.0.0.0/16"
	enable_dns_hostnames = true
	enable_dns_support = true
	tags {
		Name = "terraform-aws-vpc-example-two" 
		BillingCode = "${var.billing_code_tag}"
		Environment = "${var.environment_tag}"
	}
}

resource "aws_subnet" "subnet1" {
	cidr_block = "10.0.32.0/19"
	vpc_id = "${aws_vpc.enviornment-example-two.id}"
	availability_zone = "us-west-2a"
	tags {
		Name = "terraform-aws-vpc-example-subnet1" 
		BillingCode = "${var.billing_code_tag}"
		Environment = "${var.environment_tag}"
	}
}

resource "aws_subnet" "subnet2" {
	cidr_block = "10.0.128.0/18"
	vpc_id = "${aws_vpc.enviornment-example-two.id}"
	availability_zone = "us-west-2b"
	tags {
		Name = "terraform-aws-vpc-example-subnet2" 
		BillingCode = "${var.billing_code_tag}"
		Environment = "${var.environment_tag}"
	}
}

resource "aws_security_group" "subnetsecurity" {
	vpc_id = "${aws_vpc.enviornment-example-two.id}"

	ingress {
		cidr_blocks = [
			"${aws_vpc.enviornment-example-two.cidr_block}"
		]
		from_port = 80
		to_port = 80
		protocol ="tcp"
	}
	
	tags {
		Name = "terraform-aws-vpc-example-subnetsecurity" 
		BillingCode = "${var.billing_code_tag}"
		Environment = "${var.environment_tag}"
	}
}

resource "azurerm_resource_group" "azy_network" {
	location = "West US"
	name = "BlueTerraformGroup"
}


resource "azure_virtual_network" "blue_virtual_network" {
	address_space = ["10.0.0.0/16"]
	location = "West US"
	name = "BlueTerraNetwork"
#	resource_group_name = "BlueTerraformGroup"
#	dns_servers = ["10.0.0.4", "10.0.0.5"]
	
	subnet {
		name = "subnet1"
		address_prefix = "10.0.1.0/24"
	}
	
	subnet {
		name = "subnet2"
		address_prefix = "10.0.2.0/24"
	}
	
#	tags {
#		environment = "Blue-Terraform"
#	}
}
	