# Terminal To-Do List Application

This is command line To-Do List application built using bash that can add tasks. delete a task and also list tasks in the file(**tasks.txt)**

## Program Description
The following are some functionalities of running this program;

**Add tasks to the file** 
```bash
"add")
        if ! grep -q "^$arg2" "$FILE"; then
            echo "$arg2, $(date "+%Y-%m-%d %H:%M:%S")" >> $FILE
            echo -e "${GREEN}You just added another task"
        elif [[ $# -lt 2 ]]; then
            echo "The usage for adding task is (./todo.sh <add> <task>. For example; $0 <add> <Go shopping>)"
        else
            echo -e "${RED}This task already exist."
        fi
```
Running todo.sh add "Go shopping" on the program we get the following output;
![Adding tasks](/Screenshots/TodoAdd.png)

![Added tasks](/Screenshots/AddedTask.png)


**Delete task fro the file**
```bash
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
```
**List the tasks in the file**
```bash
  "list")
        # Checks if the tasks file exist, then displays its content or provides an error message
        if [[ -f "$FILE" ]]; then
            cat -n $FILE
        else
            echo "The tasks file you are trying to display is nonexistent"
        fi
```
Running *todo.sh* list on the program we get the following output;
![Listing tasks](/Screenshots/TodoList.png)

## Clone project
To get a local copy of this project, you can clone it at the following link 

## Author

Love Asoh

- GitHub: [@LoveAsoh](https://github.com/AsohLove)
- Twitter: [@LoveAsoh](https://twitter.com/loveasoh)
- LinkedIn: [Love Asoh](https://www.linkedin.com/in/loveasoh/)


## License 
This project is [MIT](./LICENSE) licensed.