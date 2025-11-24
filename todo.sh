#! /bin/bash

FILE="tasks.txt"
RED='\033[0;31m'
GREEN='\033[0;32m'

arg1=$1
arg2=$2

to_clear(){
    clear
    echo "Terminal cleared"
}

    #This checks to confirm that an argument is provided
    if [[ -z "$arg1" ]]; then
        echo -e "${RED}Wrong input, Usage : $0 <argument> <argument>"
        exit 1
    fi
    # Runs when the first argument($1) is provided and is correct
case "$arg1" in 
    "add")
        if ! grep -q "^$arg2" "$FILE"; then
            echo "$arg2, $(date "+%Y-%m-%d %H:%M:%S")" >> $FILE
            echo -e "${GREEN}You just added another task"
        else 
        echo -e "${RED}This task already exist."
        fi
    ;;
    "list")
    cat -n $FILE
    ;;
    "del")
        if [[ $(wc -l  < $FILE) -ge 2 && $arg2 -eq 2 ]]; then 
            sed -i '2d' $FILE
            echo -e "${GREEN}The second task of $FILE has been successfully deleted!"
        elif [[ $arg2 -ne 2 ]]; then
            echo "Your second argument should be 2"
        else 
            echo -e "${RED}The $FILE contains only one line."
        fi
    ;;
    "clear")
    to_clear
    ;;
    "-h")
        echo "You are required to input two arguments after ($0)"
        echo "  ============== " 
        echo "The default input format is: $0 {add Shopping|list|del 2}"
    ;;
    *)
        echo -e "${RED}Wrong format of arguments. Use $0 -h to see guides on the usage. "
        exit 1
        ;;

esac
