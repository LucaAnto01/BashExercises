#!/bin/bash
#@author: Luca Antognarelli
#

#variables
FILEUTENTE="/home/esercizi/esercitazione3"
#user's choose (-v: verbose mode; -h: Usage: mkaccounts [-h|-v] and exit with status 0; other: Usage: mkaccounts [-h|-v] and exit with status 1)
OPTION=$1

#valutate the value of option
case $OPTION in
    '') exit 0;;
    -v) verbose = y;;
    -h)
        echo "Usage: $0 [-h|-v]"
        exit 0;;
    *)
        echo "Usage: $0 [-h|-v]"
        exit 1;;
esac

#loop for read and split data
for ENTRY in $(cat $FILEUTENTE); do
    #split data when character is :
    USERFIRSTNAME = $(echo $ENTRY | cut -d: -f1) 
    USERLASTNAME = $(echo $ENTRY | cut -d: -f2)
    tail = $(echo $ENTRY | cut -d: -f4)

    #transofrm first character to upper case
    #cut -c 1 | tr 'a-z' 'A-Z'

    #concatenate first and last name for create userName
    USERNAME = $USERFIRSTNAME$USERLASTNAME
    
    #create a new account
    useradd USERNAME -c "$USERFIRSTNAME $USERLASTNAME"

    #number of strings ending with :1
    #grep -c :1$
done


    