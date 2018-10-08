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
# Get access key and secret key
#
ACCESS_KEY=
SECRET_KEY=
LOOP=1
ANS=no

while [ ${LOOP} -eq 1 ]
do
	LOOP=0
	clear 
	while [ "${ACCESS_KEY}" = "" ]
	do
		ACCESS_KEY="NO"
		echo 
		echo "Please provide access key or enter to exit' >>> "
		read ACCESS_KEY
	done

	clear 
	while [ "${SECRET_KEY}" = "" ]
	do
		SECRET_KEY="NO"
		echo 
		echo "Please provide secret key or enter to exit' >>> "
		read SECRET_KEY
	done

	if [ ${ACCESS_KEY} != "NO" || ${SECRET_KEY} != "NO"  ]
	then
		clear
		echo "ACCESS_KEY = ${ACCESS_KEY}"
		echo "SECRET_KEY = ${SECRET_KEY}"
		echo
		echo "If this is correct please type 'yes' >>>> "
		read ANS

		if [ "${ANS}" != "yes" ]
		then
			ACCESS_KEY=
			SECRET_KEY=
			LOOP=1
			ANS=no
		fi
	fi
done

#
# Setup the example.tf file for initilization
#
sed 's/<accessKey>/${ACCESS_KEY}/' step1.txt | sed 's/<secretKey>/${SECRET_KEY}/' > example.tf
exit 1;

#
# Initialize terraform
#
terraform init
