# Terminal To-Do List Application

This is command-line To-Do List application built using *bash* that can add tasks. delete a task and also list tasks in a file(**tasks.txt)**

## Program Description
The following are some functionalities for running this program;

**Add a task to the file**

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
Running *./todo.sh add "Go shopping"* on the program, we get the following output;
![Adding tasks](/Screenshots/TodoAdd.png)

![Added tasks](/Screenshots/AddedTask.png)


**Delete task from the file**

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
Running *todo.sh list* on the program we get the following output;
![Listing tasks](/Screenshots/TodoList.png)

## About
This app can perform three successful operations. Firstly, it permits you to add tasks that you will want to perform to a *txt* file. Secondly there is the possibility of deleting the second task on the file and finally your can list all the tasks that are currently on the file.



## Clone project
To get a local copy of this project, you can clone it [here](git@github.com:AsohLove/Terminal-To-Do-List-App.git) , navigate to the project directory(*cd Terminal-to-do-list-app*) on the terminal or command-line and then run the commands below;

- `./todo.sh add "task"`
- `./todo.sh del 2`
- `./todo.sh list`

## Author

### Love Asoh

- GitHub: [@loveasoh](https://github.com/AsohLove)
- Twitter: [@loveasoh](https://x.com/LoveTheModifier)
- LinkedIn: [love asoh](https://www.linkedin.com/in/asohlove/)


## License
This project is [MIT](./LICENSE) licensed.