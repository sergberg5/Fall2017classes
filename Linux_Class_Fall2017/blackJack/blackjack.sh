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
		tempPlayerValue=$(shuf -i 1-13 -n 1)
		#echo $tempValue
		cardValue=$(($cardValue + $tempPlayerValue))
		echo ""
		echo -n " ["
		echo -n $cardValue
		echo "] "
		count=$(($count + $counter))
		echo ""
		echo 'Do you want to hit or stay?'
		echo "Enter h to hit and s to stay"
		# echo $cardValue
		# echo $count
		accVal=print_account_value $1 2> /dev/null
		if [ "$cardValue" -eq 21 ] && [ "$count" -eq 2 ]; then
			echo "You got a Black Jack you Win!"
			echo ""
			add_bet
			echo -n "You currently have "
			print_account_value $1
			blackJack=0
			play_again
		elif [ "$cardValue" -gt 21 ]; then
			echo "You Lost :("
			sub_bet
			echo ""
			echo -n "You currently have "
			print_account_value $1
			blackJack=0
			play_again
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

computer_hand(){
	### BALLZY PLAY: Please input 15 18 or 20 into the variable $comp
	comp=17
	echo -n "Calculating computer hand"
	echo -n " ."
	while true; do
		tempPlayerValue=$(shuf -i 1-13 -n 1)
		echo -n " ."
		#echo $tempValue
		compCardValue=$(($compCardValue + $tempPlayerValue))
		echo " ."
		accVal=print_account_value $1 2> /dev/null
		if [ "$compCardValue" -eq 21 ] && [ "$count" -eq 2 ]; then
			echo "You lost :( Dealer got BlackJack"
			echo ""
			sub_bet
			echo -n "You currently have "
			print_account_value $1
			blackJack=0
			compCardValue=0
			play_again
		elif [ "$compCardValue" -gt 21 ]; then
			echo "Dealer Bust: You Win"
			add_bet
			echo -n "You currently have "
			print_account_value $1
			blackJack=0
			compCardValue=0
			play_again

		elif [ "$compCardValue" -ge "$comp" ] && [ "$compCardValue" -le 21 ]; then
			if [ "$cardValue" -ge "$compCardValue" ]; then
				echo -n " ["
				echo -n $compCardValue
				echo "] "
				echo ""
				echo "You Win"
				add_bet
				echo -n "You currently have "
				print_account_value $1
				blackJack=0
				compCardValue=0
				play_again
			else
				echo -n " ["
				echo -n $compCardValue
				echo "] "
				echo "You Lose"
				echo ""
				sub_bet
				echo -n "You currently have "
				print_account_value $1
				blackJack=0
				compCardValue=0
				play_again
			fi
				compCardValue=0
		else
			echo -n " ["
			echo -n $compCardValue
			echo "] "
		fi
	done

}

add_bet(){
	bet=$(($bet * 2))
	accVal=$(($accVal + $bet))
	echo $accVal > ./Users/$username.txt
}

sub_bet(){
	accVal=print_account_value $username 2> /dev/null
	accVal=$(($accVal - $bet))
	echo $accVal > ./Users/$username.txt
}

play_again(){
	echo "Thanks for playing, did you want to play again? (y/n)"
	read playAgain
	case $playAgain in
		"y")   
	       	player_hand $username;;
        "n")
	       	break;;
	esac
}

print_account_value() {				#account value import
	while read line; do    
    	echo -n $line 
    	echo " dollars"
    	accVal=$line  
	done < ./Users/$1.txt

	return $accVal
}

		search_user $username 
		player_hand $username
		if [ "$blackJack" != 0 ]; then
			computer_hand $username
		else
			echo "Thanks for playing did you want to play again? (y/n)"
			read playAgain
			case $playAgain in
				"y")   
					blackJack=1
	       			player_hand $username;;
        		"n")
	       			break;;
			esac
		fi
