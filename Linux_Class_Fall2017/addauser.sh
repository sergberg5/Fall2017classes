echo "//////PLEASE CREATE USERPROFILE FILE in current directory /////"
echo "//////with the format firstName,lastName,PhoneNumber,email/////"
echo "Reading userprofile ..."
#!/bin/bash
input="userprofile"

#Your script will read the account information from a text file which has the following format
#FirstName,LastName,PhoneNumber,email
#csv type files 
while IFS=',' read -r f1 f2 f3 f4
do 
	fname=$f1
	lname=$f2
	phone=$f3
	email=$f4
done < "$input"

#Your script must generate a user name with the following format: FirstLetterOfFirstNameLastName
#Example: for user Luis Barreto, the user name created must be lbarreto


#random function for password and user add function 
randpw(){ 
	password=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-8})
	echo $password
}

addinguser(){
	encryptpwd=$(openssl passwd -crypt $password )
	sudo useradd $1 -m -s /bin/bash -p $encryptpwd
}


firstLetter="$(echo $fname | head -c 1)"
username=$firstLetter$lname

#use grep to find existing user
#In case the user name is already taken your script must add a number from 1 to as many numbers needed. Some repeated user names could be of the following format:
#lbarreto
#lbarreto1
#lbarreto2
original=$username
inc=1
	while true; do
		if grep -q  $username /etc/passwd;
		then
	    	username=$original$inc
	    	inc=$((inc + 1))
		else
			randpw
			addinguser $username
			mkdir /home/$username/public_html/
    	    break
    	fi
	done
echo $username > userCreation.log
echo $password >> userCreation.log
eval echo ~$username >> userCreation.log

#Once you have those two components, your script must execute the useradd command. 

#After the account was successfully created, your script must create a public_html directory under the user’s home directory.

#After the user account is created and its home directory is configured correctly, your script must output the username, password and home directory absolute path to a userCreation.log file.
#You must submit your shell script by uploading it to iLearn.

