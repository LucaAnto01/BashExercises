#!/bin/bash
#@author: Luca Antognarelli

#this is an example of function
hello_world () 
{
    echo "hello, world $SALUTI"
}

#this is a function with a param
hello_world_unico()
{
    echo "hello $1"
}

SALUTI=$*

if [ $# != 0 ]; then
        hello_world
        hello_world_unico $1
        exit 0
else
        echo "Zao"
        exit 1
fi
