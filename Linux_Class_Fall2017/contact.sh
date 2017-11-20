echo "Please choose option below"
echo "Press 1 for new contact"
echo "Press 2 to search contact"
echo "Press 3 to delete contact"
mkdir Contacts 
read choice

search_contact() {
        if [ -e ./Contacts/$1.* ]
        then
                echo "//Contact Already in File"
		exit
        else
		echo "//Please enter Phone Number ex '8889991111'"
		read phoneNumber
		echo "//Enter your email"
		read emailAddress
		echo "//Enter in your address"
		read address
		echo 'PN: '$phoneNumber'\nEmail:'$emailAddress'\nAddress: '$address > ./Contacts/$1.DAT
        fi
}

print_contact() {
        if [ -e ./Contacts/$1.* ]
        then
                cat ./Contacts/$1.DAT
                exit
        else
                echo "//Contact not Found"
                exit
        fi
}

delete_contact() {
        if [ -e ./Contacts/$1.* ]
        then
                rm ./Contacts/$1.DAT
		echo "//Contact Removed"
                exit
        else
                echo "//Contact not found"
                exit
        fi
}

case $choice in
	"1")   echo "//Please enter first name"
	       read firstName
	       echo "//Please enter in Last Name"
	       read lastName
	       search_contact $lastName;;
        "2")
	       echo "//Please enter in Last Name"
	       read lastName
	       print_contact $lastName;;
        "3")
	       echo "//Please enter in Last Name"
               read lastName
               delete_contact $lastName;;
esac
