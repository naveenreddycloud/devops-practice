#!/bin/bash

USERID=$(id -u)

VERIFY(){
if [ $1 -ne 0 ]; then 
echo "$2 ... failure"
exit1

else 
echo "$2 ... sucess"
fi
}

if [$USERID -ne 0 ]; then 

echo "take root acces for excuting scripit "
exit1

fi

#INSTALLING JENKINS

yum update -y

VERIFY $? "updating yum"

wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

VERIFY $? "adding jenkins repo"

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

VERIFY $? "import jenkins key"

yum upgrade -y

VERIFY $? "upgarding yum"

amazon-linux-extras install java-openjdk11 -y

VERIFY $? "installing openjdk"

yum install jenkins -y 

VERIFY $? "installing jenkins"

systemctl enable jenkins 

VERIFY $? "enabling jenkins"

systemctl start jenkins

VERIFY $? "start jenkis"
