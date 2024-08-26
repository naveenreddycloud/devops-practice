#!/bin/bash

USERID=$(id -u)

if[ $USERID -ne 0 ]; then

echo "must be root user to acces"
exit1

fi

yum install git -y 

if [ $USERID -ne 0 ]; then 

echo "installing git failure"
exit1

else

echo  "installing git"

fi