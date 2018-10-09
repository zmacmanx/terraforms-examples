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
# Check for old provider key file
#
ls .provider_keys > /dev/null 2>&1
if [ ${?} -eq 0 ]
then
	rm -f .provider_keys
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
ANS=
LOOP=1
SUB_LOOP=1

while [ ${LOOP} -eq 1 ]
do
	LOOP=0

	clear 
	while [ ${SUB_LOOP} -eq 1 ]
	do
		SUB_LOOP=0

		echo 
		echo -n "Please provide access key or enter to exit' >>> "
		read ACCESS_KEY

		if [ "X${ACCESS_KEY}" != "X" ]
		then
			echo
			echo -n "Is the access key \"${ACCESS_KEY}\" correct [ N = No ] >>> "
			read ANS

			if [ "X${ANS}" = "XN" ]
			then
				SUB_LOOP=1
			fi
		fi
	done

	if [ "X${ACCESS_KEY}" != "X" ]
	then
		SUB_LOOP=1

		clear 
		while [ ${SUB_LOOP} -eq 1 ]
		do
			SUB_LOOP=0

			echo 
			echo -n "Please provide secret key or enter to exit' >>> "
			read SECRET_KEY

			if [ "X${SECRET_KEY}" != "X" ]
			then
				echo
				echo -n "Is the secret key \"${SECRET_KEY}\" correct [ N = No ] >>> "
				read ANS

				if [ "X${ANS}" = "XN" ]
				then
					SUB_LOOP=1
				fi
			fi
		done

		if [ "X${ACCESS_KEY}" != "X" ] && [ "X${SECRET_KEY}" != "X" ]
		then
			clear
			echo
			echo "ACCESS_KEY = ${ACCESS_KEY}"
			echo "SECRET_KEY = ${SECRET_KEY}"
			echo
			echo -n "If this is correct please type 'yes' >>>> "
			read ANS

			if [ "X${ANS}" != "Xyes" ]
			then
				LOOP=1
				SUB_LOOP=1
				ACCESS_KEY=
				SECRET_KEY=
				ANS=
			else
				echo "ACCESS_KEY=${ACCESS_KEY}" > .provider_keys
				echo "SECRET_KEY=${SECRET_KEY}" >> .provider_keys
			fi
		fi
	fi
done

#
# Setup the example.tf file for initilization
#
sed "s/<accessKey>/${ACCESS_KEY}/" step1.txt | sed "s/<secretKey>/${SECRET_KEY}/" > example.tf

#
# Initialize terraform
#
terraform init
