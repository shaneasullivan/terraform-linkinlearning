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