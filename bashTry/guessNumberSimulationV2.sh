#!/bin/bash

# Set the min and max values
min=1
max=10
random_number=$(( RANDOM % (max - min + 1) + min ))
guesses=0
maxTry=1000
currentTry=0
simEnd=1000
sim=0
fileName="simulationOutput.csv"
total=0
arr_diff=()

function writeLine() {
   echo $1,$2,$3 >> $fileName
}

function writeHeader() {
   echo "sim,guesses,delta" > $fileName
}

function runSim(){
  writeHeader
  for ((sim = 0 ; sim < $simEnd ; sim++)); do
    for ((currentTry = 0 ; currentTry < $maxTry ; currentTry++)); do
      guesses=$(( RANDOM % (max - min + 1) + min ))  # Generate a new guess
      if [ $guesses -eq $random_number ]; then
        break
      fi
    done
    total=$((total+currentTry))
    writeLine $sim $currentTry
  done
}

function readResults(){
  arr_sim=( $(tail -n +2 $fileName | cut -d ',' -f1) )
  arr_guesses=( $(tail -n +2 $fileName | cut -d ',' -f2) )
}

function calcDiff(){
  Average=$((total/simEnd))
  for ((sim = 0 ; sim < $simEnd ; sim++)); do
    arr_diff[$sim]=$((arr_guesses[sim]-$Average))
  done
}

function WriteFileWithDiff(){
  writeHeader
  for ((sim = 0 ; sim < $simEnd ; sim++)); do
    writeLine ${arr_sim[sim]} ${arr_guesses[sim]} ${arr_diff[sim]}
  done
   writeLine "" $Average ""
}
function printTopTen(){
  echo "Alle Resultate nahe bei der Abweichung";
  awk -F, '{print $1, $2, $3, sqrt($3^2)}' $fileName | sort -k4,4n -t' ' | head -12 | tail -10 | sort -k1,4n -t' ' | cut -d ' ' -f1-3;

  echo "Alle Top Ten Resultate einmalig nach Abweichung";
  awk -F, '$1 != "" && $1 <= 1000  {print $1, $2, $3, sqrt($3^2)}' "$fileName" \
    | sort -k4,4n -t' ' \
    | awk '{if (!seen[$4, ($3 < 0 ? "-" : "+")]++) print $0}' \
    | head -10 \
    | cut -d ' ' -f1-3;
}

runSim
readResults
calcDiff
WriteFileWithDiff
printTopTen
