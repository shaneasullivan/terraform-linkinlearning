
##################################################################################
# PROVIDERS
##################################################################################

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
  assume_role {
    role_arn  = "arn:aws:iam::${var.aws_trusted_account}:role/${var.aws_role_name}"
  }
}

provider "google" {
	credentials = "${file("../account.json")}"
	project = "proud-amphora-182121"
	region = "us-west1"
}

provider "azurerm" {
	subscription_id = "0"
	client_id = "1"
	client_secret = "2"
	tenant_id = "3"
}	