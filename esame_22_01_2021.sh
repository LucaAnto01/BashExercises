#!/bin/bash
#@author: Luca Antognarelli

#Check params
function errorFunction()
{
    
    echo "Usage: rgb.sh <red/green/blue>"
    exit 255
    
}

COLOR=$1
#valutate the value of COLOR
case $COLOR in
    red)
        echo "is red color"
        exit 0;;
    green)
        echo "is green color"
        exit 0;;
    blue)
        echo "is blue color"
        exit 0;;
    *)
        errorFunction;;
esac