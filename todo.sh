#! /bin/bash

FILE="tasks.txt"

    #This checks to confirm that an argument is provided
    if [[ -z "$1" ]]; then
        echo "Wrong input, Usage : $0 <argument> <argument>"
        exit 1
    fi
    # Runs when the first argument($1) is provided and is correct
case "$1" in 
    "add")
    echo "$2" >>$FILE
    ;;
    "list")
    cat -n tasks.txt
    ;;
    "del")
        if [[ $(wc -l  < $FILE) -ge 2 ]]; then 
            sed -i '2d' $FILE
            echo "The second line of $FILE has been successfully deleted!"
        else 
            echo "The $FILE contains only one line."
        fi

    
    ;;
    "-h")
        echo "You are required to input two arguments after ($0)"
        echo "  ============== " 
        echo "The default way is as follows: $0 {add "Shopping"|list|del 2}"
    ;;
    *)
        echo "Wrong arguments for "
        exit 1
        ;;

esac
