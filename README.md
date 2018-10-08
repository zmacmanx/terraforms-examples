<<<<<<< HEAD
#
# Setup the first configuration file
#
cp step1.txt example.tf

#
# Initialize terraform environment
#
terraform init

#
# Setup the first configuration file
#
terraform plan example.tf
terraform apply example.tf

#
# Change the type of AMI.  This will cause the removal and creation
# of the ec2
#
cp step2.txt example.tf
terraform apply example.tf

#
# Remove the resources / ec2
#
terraform destroy example.tf

#
# Extend the ec2 with a new resource type.
# Add an ip address to the ec2 and show the
# implicit dependency.  It should build the ec2
# first then apply the ip.
#
cp step3.txt example.tf
terraform apply example.tf

#
# The file shows how to setup explict dependencies
# The case would reflect a need for an application to 
# have a S3 bucket before the creation of the EC2.
#
cp step4.txt example.tf
terraform apply example.tf

#
# The file shows parrellism.  Add another EC2
# resource to the file.
#
cp step5.txt example.tf
terraform apply example.tf

#
# Destroy the second ec2 resource.
#
cp step6.txt example.tf
terraform apply example.tf

#
# Provision controls added to the instance
#
cp step7.txt example.tf
terraform apply example.tf
=======
# terraforms-examples
A list of terraforms examples and tutorial
>>>>>>> d03c584aed5148f99e0198dd6c5e50d6454b1e96
