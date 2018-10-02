# terraform-linkinlearning
LinkedIn Learning Terraform Coursework

## Installing Terraform 

1. Download executable from the following location: https://www.terraform.io/downloads.html
2. Store zip file and keep zip file (each time) for the purpose of versioning 
3. Create a location to store the terraform EXE file.
	1.  Pick a location that makes sense for the work and script execution we are planning
	2.  I've selected `C:\Users\<corpusername>\Terraform`
3. Set Environment variable to the path
	1. Right click on **My Computer** and select **Properties**
	2. Enter elevated account creds if needed
	3. Select the **Path** variable in the **System Variables** section
	4. Click **Edit**
	5. Add a semicolon and the terraform path: `;C:\Users\<corpusername>\Terraform`
	6. Click OK to close all the remaining open dialog
4. Validate path to Terraform
	1. Open cmd prompt
	2. Run `terraform -version`
	3. Expect to see a version number back e.g. `Terraform v0.11.8`
