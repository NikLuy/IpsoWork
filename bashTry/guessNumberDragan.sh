#!/bin/bash
 
minNumber=1
maxNumber=10
 
while true
do
    randomNumberToCompare=$(( RANDOM % 10 + 1 ))
    read -p "Guess a number between $minNumber and $maxNumber: " guessedNumberAsString
 
    if [ -z "$guessedNumberAsString" ]
    then
        echo "number cannot be empty. Please try again."
        continue
    fi
 
    guessedNumber=$(($guessedNumberAsString))
 
    if [ $guessedNumber -lt $minNumber ] || [ $guessedNumber -gt $maxNumber ]
    then
        echo "your input is not a valid number"
    else
        if [ $guessedNumber -eq $randomNumberToCompare ]
        then
            echo "You guessed the right number"
        else
            echo "You are wrong, the right number is $randomNumberToCompare"
        fi
    fi
done
 