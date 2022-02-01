I want to point out that a very-good UNIX/LINUX [tutorial](https://www.tutorialspoint.com/unix/index.htm) is there!


# List of all the possible commands:

## Listings:

- At first time you open your terminal you'd probably be in your home directory. You can double check that by using `pwd` command.

- `ls` command lists the contents in your current directory.

- `ls -a` will lists all the contents that might have been hidden in the directory particularly that starts with `.` dot.

- `mkdir <dir_name>` will create the directory that you give inside angle bracket without brackets, though. After creating this
directory, you can `ls` to see if it is there. And, you can move into that directory using `cd <dir_name>` if the directory is in 
your current working directory area. `cd .` will not move you anywhere because `.` is your current directory you are sitting on. But,
`cd ..` will take you one directory upwards because `..` means one directory upwards from your current ones in the tree.

- `pwd` prints the working directory or the complete path you are in the giant tree system. Then, you can copy the path and use it to
your advantages.

- If you just want to see inside the directories without `cd` into there, a kind of skimming; then you can always do the `ls /path/to/
different/areas/`. Doing this will let you see what's inside each areas without actually having to sit there using `cd`.

- Your home directory is `~`. So if you do `ls ~`, it should print your home directory contents. You could do `ls ~/Desktop/` to see
what is in your Desktop area.

## Copying:

- `cp file1 file2` makes copy of `file1` in current dir and names it to `file2`.

- To copy the files located somewhere to your current dir you do `cp /path/to/file .`. Remember the `.` dot is the current dir for us.

## moving files:

- `mv file1 file2` will move (rename) `file1` into `file2`. Its like **cut and paste and rename** in windows systems.

## removing files and directories

- `rm <file_name>` to remove your files
- `rmdir <dir_name>` to remove your directory
- `rm -rf <dir_name>` to remove your directory recursively and forcefully

## Displaying contents of file on the screen

- `clear` will clear the screen. I also do `Ctrl + l` command for this
- `cat <file_name>` will display the content of the file on the screen.
- `touch <filename>` will create and/or updates the timestamps on the file
- `less filename` will display contents in much better way. Here you can see more contents hitting enter key and q to quit
- `head filename` will display first 10 lines on the screen. You can change the 10 to any like `head -20 filename`
- `tail filename` will display last 10. Similarly you can change as: `tail -20 filename` to list last 20 lines to the screen

## Searching the contents of a file

- You could use `less` for this purpose. Like say you have `science.txt` file and you want to search the word `science` into it. You
could do `less science.txt` and still in your less screen do `/science` to search this word and do `n` for the next word if it has
more than one occurrence.

- Using **grep**. It searches files for specified words or patterns. `grep science science.txt`. The **grep** command is case-sensitive.
To find all the case; do `grep -i science science.txt`. The `-i` option makes it search any-case. Now to search for phrases. You do the follwoing `grep -i 'spinning top' science.txt`. Here single quote enclose the search phrase. Som other options here: 
```
-v      // displays those line that do NOT match
-n 
-c
```

## word count (wc)

TO count the total number of words on any file.
- `wc -w science.txt`
- `wc -l science.txt` will find out how many lines the file has

## Redirection

We saw output in the terminal screen. We also have to give input from the keyboard. Also there are errors that also by default displays
on the screen. We can redirect these commands.

- **Redirecting output** We use `>` symbol to redirect the output of a command. Ex - To make the file named `list` that contains
the names of fruits, we use
```
$ cat > list
apple
banana
peaches
ctrl+d ENTER
$ ls
```
You new `list` file has been created. Because `cat` command reads the input from keyboard and `>` redirects the output which normally
goes to the screen but in this case it is going to the file named `list`. Now you can simply read this file again using `cat list`.

- **appending to the file** In the previous case, we created the new file or it would have deleted and created new ones if the file name
already existed. However, to append the contents in the file you do `>>` double forward symbols. If you had made multiple files and
wants to join them lets say into one big files, you could do so using `cat`.
`cat file1 file2 > bigFile` here `cat` is reading the contents from both the files and then outputting into the `bigFile` which
it normally outputs on the screen.

- **Redirecting the input** We use `<` symbol for this purpose. `sort` command sorts the contents alphabetically or numerically. Let's
say you start typing `sort` and type `dog cat bird ape` then the output on the screen will be already sorted once you hit enter. You
coud use this to your advantage like `$ sort < bigFile` will sort and outputs on screen which then can be stored in yet another
new file which is sorted version of `bigFile`. like
```
$ sort < bigFile > sortFile
```

## Pipes
`pipe` connects the output of one to another and many connections are possible. `$ who | sort` give the list of names in your system
in alphabetical orders.

## Wildcards
The character `*` is called a wildcard. So, if you do `$ ls list*` it will list files or dir that has `list` in the front and 
whatever in the end; it doesn't matter. Similarly, you could have done `$ ls *list` and in this case your list will have anything in
front but the end will have `list` at the back of it.

The `*` matches any number of characters; while `?` matches only one character. So, `$ ls ?ouse` will match `house` and `mouse`, but not
`grouse` since it has 2 letters before `ouse`.

## File system security (access rights)
```
$ ls -l   \\ option -l is for long listing
```
You will see lots of details about the contents of the files inside the dir. If it was dir then left most will have `d` otherwise
it will start with `-` dash. And so, `-rwx....` means the user has `read, write, execute` access to this file. We can change the file
permission also.

## Changing access rights
**chmod (changing a file mode)**
Only the owner of a file can use `chmod` to change the permission of a file. Example are:
```
$ chmod go-rwx filename
```
will remove read write and execute permission from **filename** for the group and others. Here options are:
```
u   user
g   group
o   other
a   all
r   read
w   write
x   execute
+   add permission
-   take away permission
```
Another example:
```
$ chmod a+rw filename
```
will give read write permissions for the all to **filename**.

## Processes and Jobs
Running programming in your computer that has a unique **PID**. Just do
``` $ ps
```
Process are sometimes running foreground, background or suspended. Some process will take long time and will hold the terminal from doing
other jobs. So we need to learn how to **background** some of the tasks/jobs.

**Running background processes**
To background a process just type `&` at the end of the command line. Example:
```
$ sleep 10
```
will wait given 10 seconds before continuing and giving you terminal to work. But you can run this sleep in background;
```
$ sleep 10 &
```
And that will take care of the commands and take them to background. Similarly, sometimes `emacs` take away your terminal and so you do
`&` at the end in that case as well.

**Backgronding the current foreground process**
```
$ sleep 1000        // running sleep
Ctrl+z              // suspend the process in the foreground
$ bg                // take the foreground program to the background
```

## Killing a process
Sometimes you require to kill the process because it went to the infinite loop.
To kill the program running in the foreground `ctrl+c` will work.

To kill the program suspended or background process:
```
$ sleep 100 &
$ jobs          
$ kill %4           // here 4 is the job number let's say
```

**ps (process status)**
You could kill using PIDS
```
$ sleep 1000 &
$ ps        // will list the PID to you
$ kill PID_you_want
```
Type `ps` again to see its status. If the process refuses to be removed use `-9` option as
```
$ kill -9 PID_you_want
```

## UNIX Variables
**Environment variables**
`$ echo $OSTYPE` will tell what operating system you are using. Environment variables has all the letter UPPERCASE as you can see.
You can see the list of all the environment variables in your system using `$ printenv | less`

**Shell Variables**
They are lowercase variables ex `$ echo $path` or `$ echo $history`. To see all of the defined variables you can do
`$ set | less`

## Using and setting variables
Each time you login at UNIX or LInux host, the system looks in your home directory for the initialization files. Information in these files
is used to set up your working environment. The `C` and `TC` shells uses two files called `.login` and `.cshrc`.

At login the **C** shell first reads `.cshrc` followed by `.login` The guidelines is to set ENVIRONMENT VARIABLES to `.login` and SHELL variables
to `.cshrc` file.

## Setting shell variables in the `.cshrc` file
Example to change the number of shell commands saved in the history list, you can set the history variable. It is 100 by default,
but you can increase if you wish.
`$ set history = 200`. Check if it worked by typing. `$ echo $history`. This will be temporary, to make it permanent change you need to add
it to the `.cshrc` file. To re-read the `.cshrc` file, you could do `$ source .cshrc`.



