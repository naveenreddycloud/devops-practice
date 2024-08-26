#!/bin/bash

USERID=$(id -u)
DATE=$(date +%f)
LOG="mysqlinstall ${DATE}.log"

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]; then 
        echo -e "$2 ...${R} failure" 2>&1 | tee -a $LOG
        exit1
    else 
        echo -e  "$2 ...${G} sucess" 2>&1 | tee -a $LOG
    fi
}

if [ $USERID -ne 0 ]; then
	echo -e "${R} You need to be root user to execute this script ${N}"
	exit 1
fi

dnf module disable nodejs -y &>>$LOG

VALIDATE $? "module disabled"

dnf module enable nodejs:20 -y &>>$LOG

VALIDATE $? "enabled nodejs:20"

useradd expense &>>$LOG

VALIDATE $? "useradded"

mkdir /app &>>$LOG

VALIDATE $? "app directory created"

curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip &>>$LOG

VALIDATE $? "backend Zip filed"

cd /app &>>$LOG

VALIDATE $? "in app directory"

npm install &>>$LOG

VALIDATE $? "Installing NPM"

