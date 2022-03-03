## UNIX/LINUX commands and Bash Scripting

Note: These notes are collected, compiled from different sources for my future references.
### Reference List
* [Coursera IBM Course](https://www.coursera.org/learn/hands-on-introduction-to-linux-commands-and-shell-scripting)

A **shell** is a powerful user interface for UNIX-like operating system. It can interpret commands, and run other programs.

### Working with files
```
$ cp      // copy file
$ mv      // mv file (use to rename file as well)
$ touch     // create empty file, or mostly used to update the timestamp a file
$ chmod     // change/modify file permissions (more later)
$ wc          // get counts of lines, words, characters in file (mostly used to count line with -l option)
$ grep        // return line(s) in file matching the pattern
$ rm -rf      // so powerful command to remove almost anything (files, directories)
```

### Navigating and Working with directories
```
$ ls          // list files and directories in the current directory
$ find        // find files in the current direcotry tree (this and all the directory inside of it)
$ pwd       // prints current working directory
$ mkdir     // makes a new directory
$ cd        // change directory
$ rmdir     // remove directory
```

### Compression and archiving
```
$ tar       // archive a set of files
        (allows you to copy multiple files and directories into a single archive file)
$ zip       // compress a set of files
$ unzip     // extract files from a compressed zip archive
```

### Networking
```
$ hostname      // prints hostname
$ ping        // send packets to URL and prints response, (CTRL-C) to cancel it
$ ifconfig      // display or configure system network interfaces
$ curl          // display contents of file at a URL
$ wget        // download file from URL
```

`$ df -h  (shows amount of disk space available on the file system)` extra one to know more.

Now, let's discuss some of the important commands with more details and examples.
### tar
This command lets you to copy  multiple files and directories info into a single file. Some of the options choices are:
```
 -c            // create a new archive file
 -v            // verbosely list files processed
 -f            // archive file name
```

Example:
`tar -cvf bin.tar /bin` creates an archive of the entire `/bin` directory into a file named `bin.tar`. To see the list of files in the archive, use `-t` option as:
`tar -tvf bin.tar`. To untar the archive or extract files from the archive, use `-x` option: `tar -xvf bin.tar`.

### zip
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
### Permissions
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

## wc
`wc usdoi.txt` prints the number of lines, words, and character in a file. 
* To print only the number of lines: `wc -l usdoi.txt`
* to see the number of words `wc -w usdoi.txt`
* to see the number of characters `wc -c usdoi.txt`

## grep
To perform search operations within the text, it allows you to specify patterns and search for lines matching the pattern, from the input text.

The following  command prints all lines in the file `usdoi.txt` which contain the word **people**
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
Pipe command ` | `

- chaining sequences of filter commands `command1 | command2 | ...`
- output of command1 is input of command2       `ls | sort -r`   // list sort in reverse order

## Shell variables
It has scope limited to shell (not global).

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
It has extended scope. There are number of default environment variables, but you can also upgrade shell variables into the environment variables using **export**. Like **export var_name**.
```
$ export GREETINGS
```

To list all of the environment variables:
```
$ env | grep "GREE"     // env will list all, grep GREE will list only those that starts with GREE
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

### Schedule a Shell Script
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
Put the following line:

**0 0 \* \* \* /home/project/diskusage.sh >> /home/project/diskusage.log**
