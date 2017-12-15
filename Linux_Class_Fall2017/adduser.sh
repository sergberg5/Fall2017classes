echo "Reading userpofile ..."
#!/bin/bash
input="userprofile"

#csv type files 
while IFS=',' read -r f1 f2 f3 f4
do 
	fname=$f1
	lname=$f2
	phone=$f3
	email=$f4
done < "$input"

echo $phone
echo $fname
echo $lname
echo $email

firstLetter="$(echo $fname | head -c 1)"
echo $firstLetter
username=$firstLetter$lname
echo $username

cat /etc/passwd | grep $username