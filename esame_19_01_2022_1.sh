#!/bin/bash
#@author: Luca Antognarelli

#Display error
function errorFunction()
{   
    echo "ERROR: Usage: users.sh userfile <add|remove>"
    exit 1  
}

#Check params
function check()
{
    if [ $1 -ne 2 ]; then
        errorFunction
    fi
}

#Check file input exist
function checkFile()
{
    if [[ ! -f "$1" ]]; then
        echo "ERROR: file $1 not found"
        exit 2
    fi
}

#Check user already exist
function checkUserExist()
{
    grep $1 /etc/passwd > /dev/null 2> /dev/null
}

#Create new user
function createUser()
{
    useradd $1 2> /dev/null
    if [ $? -eq 0 ]; then
        echo "User: $1 successfully created"
    fi
}

#Delete user
function deleteUser()
{
    userdel -r $1 2> /dev/null
    if [ $? -eq 0 ]; then
        echo "User: $1 successfully deleted"
    fi
}

#Read file
function readFile()
{
    USERS=$(cat $1)

    for new_user in $USERS; do

        #check user already exist
        checkUserExist $new_user
        userExist=$?
       
        ACTION=$2

        case $ACTION in
            add)
                if [ $userExist -ne 0 ]; then
                    createUser $new_user
                else
                    echo "ERROR: $new_user already exist"
                fi;;
            remove) 
                if [ $userExist -eq 0 ]; then
                    deleteUser $new_user
                else
                    echo "ERROR: $new_user doesn't exist"
                fi;;
            *)
                errorFunction;;
        esac

    done
}

#check command sintax
check $#

fileToRead=$1
#check file exist
checkFile $fileToRead

#read file
readFile $fileToRead $2