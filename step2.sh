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
# Setup the step2.txt file into example.tf
#
cat step2.txt | awk -v ACCESS_KEY=${ACCESS_KEY} -v SECRET_KEY=${SECRET_KEY}  '{
if ($1 == "access_key" )
	printf("  access_key = \"%s\"\n", ACCESS_KEY)
else if ( $1 == "secret_key" )
	printf("  secret_key = \"%s\"\n", SECRET_KEY)
else  print $0 
}' > example.tf


# Now execute the plan
#
terraform apply
