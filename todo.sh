#! /bin/bash

FILE="tasks.txt"
RED='\033[0;31m'
GREEN='\033[0;32m'

to_clear(){
    clear
    echo "Terminal cleared"
}

    #This checks to confirm that an argument is provided
    if [[ -z "$1" ]]; then
        echo -e "${RED}Wrong input, Usage : $0 <argument> <argument>"
        exit 1
    fi
    # Runs when the first argument($1) is provided and is correct
case "$1" in 
    "add")
        if ! grep -q "^$2" "$FILE"; then
            echo "$2", "$(date) ">> $FILE
            echo -e "${GREEN}You just added another task"
        else 
        echo -e "${RED}This task already exist."
        fi
    ;;
    "list")
    cat -n tasks.txt
    ;;
    "del")
        if [[ $(wc -l  < $FILE) -ge 2 ]]; then 
            sed -i '2d' $FILE
            echo -e "${GREEN}The second line of $FILE has been successfully deleted!"
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
