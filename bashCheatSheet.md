# Bash Scripting Cheatsheet

## Getting Started

### Introduction
This is a quick reference guide to Bash scripting.

- [Learn Bash in Y Minutes](https://learnxinyminutes.com/docs/bash/)
- [Bash Guide](https://mywiki.wooledge.org/BashGuide)
- [Bash Hackers Wiki](https://wiki.bash-hackers.org/)

### Example Script

```bash
#!/usr/bin/env bash

name="John"
echo "Hello $name!"
```

## Variables

```bash
name="John"
echo $name    # Without quotes
echo "$name"  # With quotes
echo "${name}!"
```

## String Quotes

```bash
name="John"
echo "Hi $name"  # Outputs: Hi John
echo 'Hi $name'  # Outputs: Hi $name
```

## Shell Execution

```bash
echo "I'm in $(pwd)"
echo "I'm in `pwd`"  # Obsolescent
```

## Conditional Execution

```bash
git commit && git push
git commit || echo "Commit failed"
```

## Functions

```bash
get_name() {
  echo "John"
}

echo "You are $(get_name)"
```

## Conditionals

```bash
if [[ -z "$string" ]]; then
  echo "String is empty"
elif [[ -n "$string" ]]; then
  echo "String is not empty"
fi
```

## Strict Mode

```bash
set -euo pipefail
IFS=$'\n\t'
```

## Brace Expansion

```bash
echo {A,B}.js
```

## Loops

### Basic For Loop

```bash
for i in /etc/rc.*; do
  echo "$i"
done
```

### C-like For Loop

```bash
for ((i = 0 ; i < 100 ; i++)); do
  echo "$i"
done
```

### Ranges

```bash
for i in {1..5}; do
    echo "Welcome $i"
done
```

### Reading Lines

```bash
while read -r line; do
  echo "$line"
done < file.txt
```

### Infinite Loop

```bash
while true; do
  # Your code here
done
```

## Functions

### Defining Functions

```bash
my_function() {
  echo "Hello from my function!"
}

my_function
```

### Functions with Arguments

```bash
my_function() {
  echo "Hello $1"
}

my_function "John"
```

## Conclusion
Bash scripting is a powerful way to automate tasks in Linux. This cheat sheet provides a quick overview of common commands and syntax to help you get started. 🚀

