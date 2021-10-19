#!/bin/bash
#@author: Luca Antognarelli
#Find account

#variables
#USERSFILE=/home/esercizi/esercitazione3/newusers

#Check params
if [ $# -ne 0 ]; then
    USERSFILE=$1
else
    echo "Using: delteaccount [file or path]"
    exit 1;
fi

for ENTRY in $(cat $USERSFILE); do

    #split data when character is :
    USERFIRSTNAME=$(echo $ENTRY | cut -d: -f1)
    USERLASTNAME=$(echo $ENTRY | cut -d: -f2)

    #concatenate user first name and user last name
    USERNAME=$USERFIRSTNAME$USERLASTNAME

    #find username in /etc/passwd
    grep $USERNAME /etc/passwd > /dev/null
    #check if we find username and show the result
    if [ $? -eq 0 ]; then
        echo "User $USERNAME exist"
    else
        echo "User $USERNAME not exist"
    fi
done