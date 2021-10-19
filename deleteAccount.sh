#!/bin/bash
#@author: Luca Antognarelli
#Delte account 

#variables
#USERSFILE=/home/esercizi/esercitazione3/newusers

#Check params
if [ $# -ne 0 ]; then
    USERSFILE=$1
else
    echo "Using: $0 [file or path]"
    exit 1;
fi

#Loop for read wich user to delte
for ENTRY in $(cat $USERSFILE); do

    #split data when character is :
    USERFIRSTNAME=$(echo $ENTRY | cut -d: -f1)
    USERLASTNAME=$(echo $ENTRY | cut -d: -f2)

    #concatenate user first name and user last name
    USERNAME=$USERFIRSTNAME$USERLASTNAME

    userdel -r $USERNAME

    if [ $? -eq 0 ]; then
        echo "Delte user $USERNAME"
    else
        echo "Impossible to delte user $USERNAME"
    fi
done

