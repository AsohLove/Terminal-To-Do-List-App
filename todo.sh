#! /bin/bash


FILE="tasks.txt"
RED='\033[0;31m'
GREEN='\033[0;32m'

arg1=$1
arg2=$2


    #This checks to confirm that an argument is provided
    if [[ -z "$arg1" ]]; then
        echo -e "${RED} You have provided the wrong input, The correct Usage is the script name along with two arguments
        \nfor adding a task: ./todo.sh <add> <task>. For example; .todo.sh <add> <Do laundry>"
        exit 1
    fi

case "$arg1" in 
    # Verify that a task does not yet exist in the file and then append it otherwise state that it already exist.
    "add")
        if ! grep -q "^$arg2" "$FILE"; then
            echo "$arg2, $(date "+%Y-%m-%d %H:%M:%S")" >> $FILE
            echo -e "${GREEN}You just added another task"
        elif [[ $# -lt 2 ]]; then
            echo "The usage for adding task is (./todo.sh <add> <task>. For example; $0 <add> <Go shopping>)"
        else
            echo -e "${RED}This task already exist."
        fi
    ;;
    "list")
        # Checks if the tasks file exist, then displays its content or provides an error message
        if [[ -f "$FILE" ]]; then
            cat -n $FILE
        else
            echo "The tasks file you are trying to display is nonexistent"
        fi
    ;;
    "del")
        #Checks if the tasks file has more than two lines and then delete the 2nd line or display error
        if [[ $(wc -l  < $FILE) -ge 2 && $arg2 -eq 2 ]]; then 
            sed -i '2d' $FILE
            echo -e "${GREEN}The second task of $FILE has been successfully deleted!"
        elif [[ $arg2 -ne 2 ]]; then
            echo -e "${RED}Your second argument should be 2"
        else 
            echo -e "${RED}The $FILE contains only one line."
        fi
    ;;
    "clear")
        # Clears the tasks file by redirection
        > $FILE

    ;;
    *)
        # Output when wrong arguments are entered
            echo -e "To run this program smoothly, you are required to provide at most two arguments after the script name.
                  \nUsage: (./todo.sh <add> <Buy Milk>), (.todo.sh <del> <2>) and (./todo.sh <list>)"
            exit 1
        ;;

esac
