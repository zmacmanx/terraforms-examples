#!bash

DEBUG=0
MSG=(
	"Start by setting up terraform with the init process"
	"Setting up a VM and Provider"
	"Changing the AMI to see the remove and rebuild of the VM"
	"Add an Elastic IP to the VM"
	""
	""
	""
	""
	""
	""
	""
)

function runStep () {
	ANS=""

	clear
	echo 
	echo "${MSG[${COUNTER}]}"
	echo
	echo "Commands to run: "
	echo

	#
	# Look for a file with the counter id and display it
	#
	ls "step${COUNTER}.sh" > /dev/null 2>&1
	if [ ${?} -eq 0 ]
	then
		if [ ${DEBUG} -eq 1 ]
		then
			cat "step${COUNTER}.sh"
		else
			echo "Step ${COUNTER}"
		fi
	fi

	echo
	echo "<Press enter to execute>"
	read ${ANS}

	#
	# Execute the step
	#
	ls "step${COUNTER}.sh" > /dev/null 2>&1
	if [ ${?} -eq 0 ]
	then
		clear
		echo "running...."
		./step${COUNTER}.sh

		if [ ${?} -ne 0 ]
		then
			echo "Error: exiting process"
			exit ${COUNTER}
		fi
	fi
}


COUNTER=0
while [  ${COUNTER} -lt 10 ]; do
	runStep ${COUNTER}
	let COUNTER=COUNTER+1 
done
