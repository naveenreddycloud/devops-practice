#!/bin/bash

#learning array concept

FRUITS=("APPLE" "MANGO" "BANNANNA")

echo "first fruit is :${FRUITS[0]}"
echo "seconf fruits is:${FRUITS[1]}"
echo "third fruit is :${FRUITS[2]}"

echo  "fruit is ${FRUITS[@]}"