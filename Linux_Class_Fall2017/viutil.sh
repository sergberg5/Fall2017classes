echo ""
echo "     Welcome to VI Utility Tool"
echo "	   Please enter first letter of command you want to perform: s for start; e for end; r for restart"
echo -n "  Type Command Here: "
read input
        case $input in
            "s" )
				vi &
				pid=$!
				;;
			"e" )
				kill -9 $pid
				;;
            "r" )
				kill -9 $pid
				vi &
				pid=$!
				;;
		esac