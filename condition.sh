#!/bin/bash 

ls -ltr

if [ $? -ne 0 ]; then 
  
  echo "above command failure"
  exit 1

  fi

  chmod go -rwx condition.sh

  if [ $? -ne 0 ]; then 
  
  echo "above command failure"
  exit 1

  fi


