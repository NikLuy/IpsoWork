#!/bin/bash

# Set the min and max values
min=1
max=10
random_number=$(( RANDOM % (max - min + 1) + min ))
guess=0
try=1000
currentTry=0

echo let\'s start a Game!
echo "I will think of a number between $min and $max, and you have to guess it."
echo "I have my number and you now have $try tries"

for ((currentTry = 0 ; i < $try ; i++)); do
  let guess=$(( RANDOM % (max - min + 1) + min ))

  if [ $guess -eq $random_number ]; then
    break
  else
    let currentTry++
    continue
  fi

done

# If user runs out of tries, reveal the correct number
if [ "$currentTry" -ge "$try" ]; then
  echo "Sorry, you're out of tries! The correct number was $random_number."
else
  echo "You manged to get the correct Answer afther $currentTry tries! The correct number was $guess." 
fi

