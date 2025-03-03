#!/bin/bash

# Set the min and max values
min=1
max=10
random_number=$(( RANDOM % (max - min + 1) + min ))
guess=0
try=3
currentTry=0

echo Hello, who am I talking to?
read varname
echo It\'s nice to meet you $varname
echo let\'s start a Game!
echo "I will think of a number between $min and $max, and you have to guess it."
echo "I have my number and you now have $try trys"

for ((currentTry = 0 ; i < $try ; i++)); do
  read -p "Guess the number: " input

  if [ $input -lt $random_number ]; then
    let currentTry++
    echo "Too low... you have $((try - currentTry)) tries left."
    continue
  fi

  if [ $input -gt $random_number ]; then
    let currentTry++
    echo "Too high... you have $((try - currentTry)) tries left."
    continue
  fi

  if [ $input -eq $random_number ]; then
    echo "You are great!! this was my Number and you have $((try - currentTry)) tries left."
    break
  fi
done

# If user runs out of tries, reveal the correct number
if [ "$currentTry" -ge "$try" ]; then
echo "Sorry, you're out of tries! The correct number was $random_number."
fi

