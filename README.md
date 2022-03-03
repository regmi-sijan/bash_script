# UNIX/LINUX commands and Bash Scripting

Note: These notes are collected, compiled from different sources for my future references.
### Reference List
* [Coursera IBM Course](https://www.coursera.org/learn/hands-on-introduction-to-linux-commands-and-shell-scripting)
* [tutorials point](https://www.tutorialspoint.com/unix/index.htm)
* [Unix tutorial for beginners](http://www.ee.surrey.ac.uk/Teaching/Unix/)

After you complete one or two of above, maybe you want to move to this advanced course on Bash-Scripting Guide:
* [Advanced Bash-Scripting Guide](https://tldp.org/LDP/abs/html/index.html)

A **shell** is a powerful user interface for UNIX-like operating system. It can interpret commands, and run other programs.

## Starting with some basics:
```
$ pwd                   // tells you the current working directory with the complete path to reach from root dir
$ ls                    // lists files and directories in your current dir
$ ls -a                 // -a option allows you to list even the hidden files and folder
$ mkdir <dir_name>      // makes the dir_name folder in current dir
$ cd dir_name           // change your directory to this new dir_name folder
$ cd ..                 // brings you one directory up (going backward in directory tree)
```

**Trick**:
If you want to just skim around different directories without actually changing your directory, you can do so using `$ ls` command. You can just **ls** the directories you want to quickly peek into and sort of use **up and down** arrow keys to quickly move back and forth to previoulsy typed areas. I always use this method to go into the very deep of the directory root and when I see where I want to go, I finally do up key and **cd** into this directory.

**cd -** is another tip to quckly move back and forth between the current directory and the last directory area you visited.

## Working with files
```
$ cp                            // copy file
$ cp file1 file2                // makes copy of file1 in current dir and names if file2
$ cp /path/of/file ./           // copies the file from this path to your current dir
$ mv                            // mv file (use to rename file as well)
$ mv file1 file2                // renames file1 to file2 (same contents inside)
$ touch                         // create empty file, or mostly used to update the timestamp a file
$ chmod                         // change/modify file permissions (more later)
$ wc                            // get counts of lines, words, characters in file (mostly used to count line with -l option)
$ grep                          // return line(s) in file matching the pattern
$ rm <file_name>                // removes file_name
$ rmdir <dir_name>              // removes dir_name
$ rm -rf <file/dir_name>        // so powerful command to remove almost anything (files, directories)
```

## Displaying contents of file on the screen

- `clear` will clear the screen. I also do `Ctrl + l` command for this
- `cat <file_name>` will display the content of the file on the screen. It is not good for long file. Since it shows all at once
- `touch <filename>` will create and/or updates the timestamps on the file
- `less filename` will display contents in much better way. Here you can see more contents hitting enter key and q to quit. Here one page from top at a time
- `head filename` will display first 10 lines on the screen. You can change the 10 to any like `head -20 filename`
- `tail filename` will display last 10. Similarly you can change as: `tail -20 filename` to list last 20 lines to the screen

## Searching the contents of the file
* One way to do the search is using **less** command. Once you do `$ less file_name`, then in your less mode do `/search_word` to do the search. Once it finds, hit enter and do **n** for the next occurrence and so on.

* Using **grep** is another way of doing this: To perform search operations within the text, it allows you to specify patterns and search for lines matching the pattern, from the input text. The following command prints all lines in the file `usdoi.txt` which contain the word **people**
```
grep people usdoi.txt
```
Some options:
```
-n              // along with the matching lines, print the line number also
-c              // get the count of matching lines
-i              // ignore the case of the text while matching
-v              // print all lines which do not contain the pattern
-w              // match only if the pattern matches whole words
```
One more example:
```
grep -v login /etc/passwd               // prints all lines from the /etc/passwd file, which do not contain the pattern login
```
* Using **find**: `$ find  // finds files in the current direcotry tree (this and all the directory inside of it)`.

## Compression and archiving
```
$ tar       // archive a set of files
        (allows you to copy multiple files and directories into a single archive file)
$ zip       // compress a set of files
$ unzip     // extract files from a compressed zip archive
```

## Networking
```
$ hostname      // prints hostname
$ ping        // send packets to URL and prints response, (CTRL-C) to cancel it
$ ifconfig      // display or configure system network interfaces
$ curl          // display contents of file at a URL
$ wget        // download file from URL
```

`$ df -h  (shows amount of disk space available on the file system)` extra one to know more.

Now, let's discuss some of the important commands with more details and examples.
## tar
This command lets you to copy  multiple files and directories info into a single file. Some of the options choices are:
```
 -c            // create a new archive file
 -v            // verbosely list files processed
 -f            // archive file name
```

Example:
`tar -cvf bin.tar /bin` creates an archive of the entire `/bin` directory into a file named `bin.tar`. To see the list of files in the archive, use `-t` option as:
`tar -tvf bin.tar`. To untar the archive or extract files from the archive, use `-x` option: `tar -xvf bin.tar`.

## zip
zip command allows you to compress files. The following command creates a zip named `config.zip` and of all the files with extension `.conf` in the `/etc` directory
```
zip config.zip /etc/*.conf
        -r option can be included to zip entire folder
```
The following command creates an archive of the `/bin` directory `zip -r bin.zip /bin`.
We can extract, list or test compressed files in a zip archive (unzip). The following command lists the files of the archive called `config.zip`
```
unzip -l config.zip
```
And, the following command extracts all the files in the archive `bin.zip`.
```
unzip bin.zip
```
## Permissions/ Chaning access rights
Only the owner of a file can use `chmod` to change the permission of a file. Example like: `$ chomod go-rwx filename` will remove read, write, and execute permission from *filename* for the group and others. Another one: `$ chmod a+rw filename` will add to all the read, write permission to *filename*.
```
--r    // read
--w    // write
--x    // execute
```
To see current permissions, `ls -l` or if you like to see the permission for a particular file `ls -l fileName.txt`, you should see something like
```
rw--r--r--          // (owner read and write, group owner read only, others read only)
```
Then we can now change the permissions of the file as per our requirements.

`r, w, x`       // representing read, write, and execute permissions respectively
`u, g, o`       // user categories owner, group, other
`+, -`          // grant or revoke operations

The command below removes read permission for usdoi.txt file (this permission is updated for all the user groups):
```
chmod -r usdoi.txt
```
Similarly, to add read permission to this file:
```
chomod +r usdoi.txt
```
To remove teh read permission for others category:
```
chmod o-r usdoi.txt
```
## Processes and Jobs
Running programming in your computer that has a unique **PID**. Just do `$ ps`. Process are sometimes running foreground, background or suspended. Some process will take long time and will hold the terminal from doing other jobs. So we need to learn how to put to **background** some of the tasks/jobs.

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

**Backgrounding the current foreground process**: already running thing can be also put into the background
```
$ sleep 1000        // running sleep
Ctrl+z              // suspend the process in the foreground
$ bg                // take the foreground program to the background
```

**Killing a process**
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

## wc
`wc usdoi.txt` prints the number of lines, words, and character in a file. 
* To print only the number of lines: `wc -l usdoi.txt`
* to see the number of words `wc -w usdoi.txt`
* to see the number of characters `wc -c usdoi.txt`

## Networking
`hostname -l` to view ip address of the host

To test if the host is reachable:
```
ping www.google.com             // ctrl-c to cancel
```

To display contents from the web on the screen:
```
curl https://......./*.txt
```

To access given URL and save it in the current directory
```
curl- o https://..../*.txt
```

To view permission of dir-name
```
ls -ld dir_name
```

# Script
* list of commands interpreted by a scripting language, scripting language are not compiled but interpreted during the run-time, so it is slower in running! but development of the code is faster
* commands can be entered interactively or listed in a text file
* used to automate processes

## Shell script
It is a executable text file with interpreter directive, aka **shebang** directive `#!interpreter [optional-args]`. Here, `interpreter` is a path to an executable program,
`optional-arg` is s single argument string.

For **bash** shell: `#!/bin/bash`. Let's write down a simple *hello_world* script that will print hello world
```
$ touch hello_world.sh
$ echo '#!/bin/bash' >> hello_world.sh
$ echo 'echo Hello World' >> hello_world.sh       // >> is the redirection operator to append to the file
```
We need to make this file executable:

First check: `$ ls -l hello_world.sh`   it might be `--rw-rw-r` with no `x` that means it is not executable.

Next we need to change it to exectuable: `$ chmod +x hello_world.sh`       // it makes `-rwx-rwx-rx`

Last, we run the script file:  `$ ./hello_world.sh`

## Pipes and Filters
Pipe command ` | `  connects the output of one to another and long chain of connections are possible. `$ who | sort` gives the list of names in your system in alphabetical orders.

- chaining sequences of filter commands `command1 | command2 | ...`
- output of command1 is input of command2       `ls | sort -r`   // list sort in reverse order

## Shell variables
It has scope limited to shell (not global). They are all **small letters** to make easier to separate from Environment variables.

To list all shell variables
```
$ set | head -4         // set will list all variables, but head -4 will restrict to only 4 of them to see
```

How to define shell-variables: **$ var_name=value**
```
$ GREETINGS="HELLO"            // we normally do all caps for the variables, and no spaces around = sign
$ echo $GREETINGS       // to see the value of this variable, we put $ sign infront of it
```

**$ unset var_name**  // deletes var_name `$ unset GREETINGS`, then no longer now available

## Environment Variables
They are all CAPITAL letters. It has extended scope. There are number of default environment variables, but you can also upgrade shell variables into the environment variables using **export**. Like **export var_name**.
```
$ export GREETINGS
```

To list all of the environment variables: `$ printenv | less` to see in easier *less* way.
```
$ printenv | grep "GREE"     // env will list all, grep GREE will list only those that starts with GREE
```

## Some useful features of the Bash shell
### Metacharacters
```
 #                              // precedes a comment
 ;                              // command separator `$ echo "Hello"; whoami` will exectue both commands one after another
 *                              // wildcard one or any number of times
 ?                              // wildcard for only one number of time
 \                              // escape character `$ echo "\$1 each"` will print $1 as a literal text
 double quote " "              // evaluates the metacharacter as normal, need escape to avoid metacharacters
 single quote ' '              // interpret everything literally, don't need escape for other metacharacters
```

## I/O redirection
```
>               // redirects output (from terminal) to a file, it also creates a file if it doesn't exist already `$ echo "hello" > hello.sh`
>>              // instead of deleting and adding, this will append to the end of the file
2>              // redirects standard error to file
2>>             // appends std. error to file
<               // redirects file content to standard input
```

Let's go through one example:
```
$ echo "line1" > eg.txt                // creates eg.txt and adds line1 in line 1 of the file
$ cat eg.txt                            // to see what's in the line1
$ echo "line2" >> eg.txt                // appends line2 in line 2 of the file
$ cat eg.txt                            // verify if it is the case

$ garbage       // will throw an error: garbage: command not found
$ garbage 2> err.txt    // we will sometime like to save what errors is our command throwing at us (saving in a file)
```

## Command Substitution
Replace command with its output. `$(command)`. It stores the output of one command as the variable values. Example:
```
$ here=$(pwd)           // save the output generated by command pwd in a variable
$ echo $here            // indeed here variable created with the value of pwd
```

## Batch mode vs. Concurrent mode
**Batch Mode**: commands run sequentially     ` $ command1; command2`
**Concurrent Mode**: commands run in parallel   `$ command1 & command2`  // & puts command1 in background and runs command2 in foreground and running

# Bash Scripting Advanced
## command pipeline:
It is a feature of the shell, that helps us to combine different unrelated commands in such a way that one commands output is sent directly as input to the next command. This way, what is not possilbe with a single command can be made possible by connecting multiple commands.

Example: To count the total number of files and folders in your current directory:
```
$ ls | wc -l    // ls lists the files, wc -l now will count them and only prints the total line numbers

$ df -h | grep overlay  // df -h gives us disk usage info, and grep allows to show only the one that is overlay
```

How to list five (or any number) largest files in some directory or current dir:
```
$ ls -ls /bin | head -6         // -s option sorts the files from largest to smallest size
```

## Command line arguments
Command line arguments are a very convenient way to pass inputs to a script. Command line arguments can be accessed inside the script as `$1, $2, and so on`. `$1` is the first argument, `$2` is the second argument, and so on.

Let's see one example case: make a file name **wish.sh**
```
#!/bin/bash
echo "Hi $1 $2"
echo "$1 is your firstname"
echo "$2 is your lastname"
```

Next, you do compile and run:
```
$ chmod +x wish.sh              // making executable
$ ./wish.sh Shyam Chauhan       // Shyam is first agrument given, Chauhan is second argument given
        prints: Hi Shyam Chauhan
                Shyam is your firstname
                Chauhan is your lastname
```

example2: let's make **dirinfo.sh** file:
```
#!/bin/bash
dircount=$(find $1 -type d | wc -l)             // counts directory in $1 argument provided later in command line
filecount=$(find $1 -type f | wc -l)            // counts file number
echo "There are $dircount directories in the directory $1"
echo "There are $filecount files in the directory $1"
```

Next, compile and run
```
$ chmod +x dirinfo.sh
$ ./dirinfo.sh /tmp             // we want to see info of /tmp folder here
```

**Problem**
Display the count of all files whose name starts with 'c' in the /bin directory:

sol:
```
$ find /bin/c* -type f | wc -l
```

Write a Shell script named *latest_warnings.sh* that prints the latest 5 warnings from the */var/log/bootstrap.log* file

sol:
```
#!/bin/bash
grep warning /var/log/bootstrap.log | tail -5
```

## Scheduling jobs using Cron
This is helpful when you might need to run certain jobs automatically at certain times. Example- load scripts at midnight every night, backup scripts to run every Sunday at 2 pm or something.

**Crontab** file is a simple text file containing a list of commands meant to be run at specified times. It is edited using the *crontab* command.

Each line is crontab file has five time-and-date fields, followed by a command, followed by a newline character `\n`. The fields are separated by spaces.

```
minute  (0-50)
hour    (0-23, 0=midnight)
day     (1-31)
month   (1-12)
weekday (0-6, 0=Sunday)
```

To use crontab:
```
$ crontab -l            // -l option prints the current crotab jobs list
$ crontab -e            // if no jobs queued, create new crontab file (it should open this file in your default editor)
```

Let's say you put the following line in your crontab file:

**0 21 \* \* \* echo "Welcome to cron" >> /tmp/echo.txt**

This means it should run in **0** min **21 hr** everyday, and the output of this crontab file is finally sent to the */tmp/echo.txt* file as well.

Once you have created the crontab file, you might go back and check to see if the jobs are now schedule as you wish using `$ crontab -l`.

## Schedule a Shell Script
Let's create a simple shell script file name *diskusage.sh* that prints the current time and the current disk usage statistics.
```
#!/bin/bash
date
df -h
```

Then compile and run:
```
$ chmod +x diskusage.sh
$ ./diskusage.sh
```

Let's schedule to run this scripts everyday at midnight 12:00 (0 in 24 hr clock). And, we want the output of this script be appended to */home/project/diskusage.log*:
```
$ crontab -e            // edit the crontab file now
```
Put the following line into crontab file:

**0 0 \* \* \* /home/project/diskusage.sh >> /home/project/diskusage.log**. The moment you put some commands into your crontab file, it is schedule as needed.

Then, `$ crontab -l` to confirm that the job has been put into the schedule.

## Remove the current crontab:
The `-r` option `$ crontab -r` causes the current crontab to be removed. Be cautious doing this as it removes your entire scheduled crontab jobs.

