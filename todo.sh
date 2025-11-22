#! /bin/bash

FILE="tasks.txt"


#    if [[ $1 -eq "add" ]]; then
#         echo "$2" >> tasks.txt
#         break
#     elif [[ $1 = "list" ]]; then
#      cat n tasks.txt
#     elif [[ $1 = "del" ]]; then 
#         sed '2d' tasks.txt
#     fi 
# done

# while [[ "$#" -gt 0 ]]; do

    if [[ -z "$1" ]]; then
        echo "Wrong input, Usage : $0 <argument> <argument>"
        exit 1
    fi
case "$1" in 
    "add")
    echo "$2" >>$FILE
    ;;
    "list")
    cat -n tasks.txt
    ;;
    "del")
    sed -i '2d' $FILE
    ;;
    "-h")
        echo "You are required to input two arguments after todo.sh($0)"
        echo "Default: $0 {add "Shopping"|list|del 2}"
    ;;
    *)
        echo "Wrong arguments for $1"
        exit 1
        ;;

esac
# done