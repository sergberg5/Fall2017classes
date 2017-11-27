echo ""
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
		echo "" 
		echo "Please input the amount you want to bet"
		read bet
		count=0
		counter=1
		cardValue=0
	while true; do
		tempValue=$(shuf -i 1-13 -n 1)
		#echo $tempValue
		cardValue=$(($cardValue + $tempValue))
		echo ""
		echo -n "Your current card value is " 
		echo $cardValue;
		count=$(($count + $counter))
		echo ""
		echo 'Do you want to hit or stay?'
		echo "Enter h to hit and s to stay"
		# echo $cardValue
		# echo $count
		if [ "$cardValue" -eq 21 ] && [ "$count" -eq 2 ]; then
			echo "You got a Black Jack you Win!"
			echo ""
			echo -n "You currently have "
			print_account_value $1
			player_hand $1
		elif [ "$cardValue" -gt 21 ]; then
			echo "You Lost :("

			accVal=print_account_value $1 2> /dev/null
			accVal=$(($accVal - $bet))
			echo $accVal > ./Users/$1.txt
			echo ""
			echo -n "You currently have "
			print_account_value $1
			player_hand $1
		fi

		read userInput
		
		case $userInput in

		"h")   
	       ;;
        "s")
	       break;;
		esac
	done
	return $cardValue
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
    	accVal=$line  
	done < ./Users/$1.txt

	return $accVal
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
		computerHand = $(computer_hand)

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
