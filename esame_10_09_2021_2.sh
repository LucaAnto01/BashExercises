#!/bin/bash
#@author: Luca Antognarelli

#Display error
function errorFunction()
{   
    echo "ERROR: Usage: manageusers.sh <username> <add/remove/info>"
    exit 1  
}

#Check params
function check()
{
    if [ $1 -ne 2 ]; then
        errorFunction
    fi
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

#Get user info
function userInfo()
{
    echo "$(id $1)"
}

#check command sintax
check $#

uname=$1 #username
ACTION=$2 #action

#execute the action
case $ACTION in
    add)
        createUser $uname;;
    remove) 
        deleteUser $uname;;
    info)
        userInfo $uname;;
    *)
        errorFunction;;
esac