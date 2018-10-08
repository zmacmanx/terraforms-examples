#!bash

#
# Run the plan command to see what will be executed
#
terraform plan

#
# Split the commands
#
echo
echo ">>> Press Return To Continue"
read ANS
clear

#
# Now execute the plan
#
terraform apply
