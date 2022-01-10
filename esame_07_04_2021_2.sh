#!/bin/bash
#@author: Luca Antognarelli

#Display error
function errorFunction()
{   
    echo "​ERROR: Usage: /exam/exercise7/createuser.sh list/add/remove <username>"
    exit 1  
}

#Check params
function check()
{
    if [ $1 -gt 2 ] || [ $1 -eq 0 ]; then
        errorFunction
    fi
}

#check command sintax
check $#

action=$1

case $action in
    list)
        echo $(cut -d: -f1 /etc/passwd) #show only the users' username
        exit 0;;
    add)
        #echo $(useradd $2)
        echo "Done!"
        exit 0;;
    remove)
        #echo $(userdel -r $2)
        echo "Done!"
        exit 0;;
    *)
        errorFunction;;
esac