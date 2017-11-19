echo "Please choose option below"
echo "Press 1 for new contact"
echo "Press 2 to search contact"
echo "Press 3 to delete contact"

read choice

if["$choice" == 1]; then
	echo "Please enter in First Name"
	read firstName
	echo "Please enter in Last Name"
	read lastName
	
else 
	echo "Whoops Wrong Input"
fi