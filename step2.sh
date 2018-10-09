#!bash

#
# Source the provider information
#
. .provider_keys

#
# Check for access and secret keys
#
if [ "X${ACCESS_KEY}" = "X" ] || [ "X${SECRET_KEY}" = "X" ]
then
	echo "Keys missing for the provider"
	exit 2
fi

#
# Copy the step2.txt file into example.tf
#
sed "s/<accessKey>/${ACCESS_KEY}/" step2.txt | sed "s/<secretKey>/${SECRET_KEY}/" > example.tf

# Now execute the plan
#
terraform apply
