echo "     Please enter in your username with no trailing white spaces     "
echo ""
mkdir Users 2> /dev/null
echo -n "USERNAME: "  
read username
echo ""

search_user() {
        if [ -e ./Users/$1.txt ]     #old user
        then
            echo '     Welcome Back '$1'!'
            echo -n "     Your current account balance is "
            print_account_value $1
        else   						 #new user
			echo '100' > ./Users/$1.txt
			echo -n "     Account created, you have a blance of " 
			print_account_value $1
        fi
}

player_hand(){
	while
	cardValue = shuf -i 1-13 -n 1

}

card_value(){
	case $1 in

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

print_account_value() {				#account value import
	while read line; do    
    	echo -n $line 
    	echo " dollars"    
	done < ./Users/$1.txt
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

# case $username in

		search_user $username 
		player_hand $username
		# "1")   echo "//Please enter first name"
	 #       read firstName
	 #       echo "//Please enter in Last Name"
	 #       read lastName
	 #       search_contact $lastName;;
  #       "2")
	 #       echo "//Please enter in Last Name"
	 #       read lastName
	 #       print_contact $lastName;;
  #       "3")
	 #       echo "//Please enter in Last Name"
  #              read lastName
  #              delete_contact $lastName;;
# esac
