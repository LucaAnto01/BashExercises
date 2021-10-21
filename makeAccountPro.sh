#!/bin/bash
#@author: Luca Antognarelli
#

#variables
HELPMESSAGE="Usage: $0 [-h|-v] [file or path]"

#user's choose (-v: verbose mode; -h: Usage: mkaccounts [-h|-v] and exit with status 0; other: Usage: mkaccounts [-h|-v] and exit with status 1)

OPTION=$1

#valutate the value of option
case $OPTION in
    '') exit 0;;
    -v) verbose=y;;
    -h)
        echo $HELPMESSAGE
        exit 0;;
    *)
        echo $HELPMESSAGE
        exit 1;;
esac

if ! [ $# -ge 2 ]; then
    echo $HELPMESSAGE
    exit 2;
else
    USERFILE=$2
fi

#loop for read and split data
for ENTRY in $(cat $USERFILE); do

    #split data when character is :
    USERFIRSTNAME=$(echo $ENTRY | cut -d: -f1) 
    USERLASTNAME=$(echo $ENTRY | cut -d: -f2)
    tail=$(echo $ENTRY | cut -d: -f4)

    #concatenate first and last name for create userName
    USERNAME=$USERFIRSTNAME$USERLASTNAME

    if [ "$verbose" = "y" ]; then
        echo "Wait for create user: $USERNAME"
    fi
    
    #create a new account
    #it could be necessary to add "sudo"
    useradd $USERNAME -c "$USERFIRSTNAME $USERLASTNAME" 2> errorsFile

    OUTCOME=$?

    if [ $OUTCOME -eq 0 ] && [ "$verbose" = "y" ]; then
        echo "$USERNAME user has been created"
    elif [ $OUTCOME -eq 9 ]; then
        echo "$USERNAME user already exist"
    else
        echo "Impossible to create $USERNAME user"
    fi

done


    