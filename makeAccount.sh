#!/bin/bash
#@author: Luca Antognarelli
#Make account

#variables
#USERSFILE=/home/esercizi/esercitazione3/newusers

#Check params
if [ $# -ne 0 ]; then
    USERSFILE=$1
else
    echo "Using: $0 [file or path]"
    exit 1;
fi

#loop for read and split data
for ENTRY in $(cat $USERSFILE); do

    #split data when character is :
    USERFIRSTNAME=$(echo $ENTRY | cut -d: -f1) 
    USERLASTNAME=$(echo $ENTRY | cut -d: -f2)
    tail=$(echo $ENTRY | cut -d: -f4)

    #transofrm first character to upper case
    #cut -c 1 | tr 'a-z' 'A-Z'

    #concatenate first and last name for create userName
    USERNAME=$USERFIRSTNAME$USERLASTNAME
    
    #create a new account
    useradd $USERNAME -c "$USERFIRSTNAME $USERLASTNAME"

    if[$? -eq 0]; then
        echo "Create user $USERNAME"
    else
        echo "Impossible to create user $USERNAME"
    fi

    #number of strings ending with :1
    #grep -c :1$
done


    