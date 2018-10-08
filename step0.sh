#!bash

#
# Check for old terraform state files
#
ls terraform.tfstate terraform.tfstate.backup > /dev/null 2>&1
if [ ${?} -eq 0 ]
then
	rm -f terraform.tfstate terraform.tfstate.backup
fi

#
# Check for old .terraform directory
#
ls .terraform > /dev/null 2>&1
if [ ${?} -eq 0 ]
then
	rm -rf .terraform
fi

#
# Check for old files from an old 
#
ls ip_address.txt > /dev/null 2>&1
if [ ${?} -eq 0 ]
then
	rm -f ip_address.txt
fi

#
# Setup the example.tf file for initilization
#
cp step1.txt example.tf

#
# Initialize terraform
#
terraform init
