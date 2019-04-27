# A dmenu binary prompt script
# Gives you a shutdown prompt with different power options

#!/bin/zsh

# Give the user a choice of a power command
powermenu=$(cat ~/.scripts/powermenu | awk '{print $1}')
power=$(echo "$powermenu" | dmenu -i -p "What do you want to do?")

# Run the chosen command v1
#if [ "$power" = "nothing" ]
#then
#	exit 0
#else
#	"$power" now
#fi

# Run the chosen command v2
"$power" now
