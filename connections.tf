
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
	subscription_id = "${var.azure_subscription_id}"
	client_id = "${var.azure_client_id}"
	client_secret = "${var.azure_client_secret}"
	tenant_id = "${var.azure_tenant_id}"
}	