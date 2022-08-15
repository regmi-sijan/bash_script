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


# Text-Parsing (AWK)
>**Important to remember is that there are text-parsing tools that you can use for your needs to search/filter/ out the required patterns for your programming needs** -> just be aware of this


In simple terms, it is a common programming task that separates the given series of text into smaller components based on some rules. We could use various programming laguages to accomplish the text-parsing like using python's Regular Expressions, Tokenization; perl scripts; or **awk** for UNIX-like system doing readily from the command-lines. With awk we can process large size data texts because, instead of loading the entire text into memory, we're reading it sequentially in chunks. AWK is a pattern matching programming language.

Awk main syntax:
```bash
awk [ -F fs] [ -v var=value ]  [ 'prog' | -f progfile  ] [ file ...]
```
Like:
```bash
awk 'length($0) < 100' input.txt
```
Note here that we need to **enclose our inline program in quotes**. This one lines program is okay, but many times we will have multiple lines in our program, and this method won't be efficient. So we need to make the script file. Let's see how to run one of these awk script files that contains the programming part inside.
```bash
awk -f comments.awk input.txt
```
Here, scripts (program statements) are in comments.awk file.

action statements and conditions go like this: `condition {action}`. Like: `length($0) < 100 { print }`. This means print if the total charachters are less than 100. But here we are missing the head title of the text and also the total comments in the text file. So we use BEGIN and END patterns which are executed only once. BEGIN is used before receiving any input and END after processing all input. In this way, they can be used to perform startup and cleanup actions in your AWK programs. Although, it is not absolutely required to use BEGIN and END in you awk program, but it is considered a good practice to do so. You could even include multiple BEGIN and END blocks in your program. So, let's extend the previous awk commands to accomodate this new requirements:
```
BEGIN { 
        print "User Feedback (Only Short Comments)" 
}
length($0 < 100) { count++; print $0 }
END { 
        print "Percentage of Short Comments: ", (count/NR)*100, "%" 
}
```
Let's interpret above statements: count variable is not initialized because awk uses default value 0 for the variables. We used built-in **NR** variable, that gives us the number of lines that we've read so far. Also, inside the action block {}, to execute separate statements either we need to put them in the separate lines or separate them with semi-colon ";" as above.

**Field variables are formed by using $ prefix before any field index**
- $0 indicates all the columns available
- $1 indicates the first column
- $2 second column
- ...
- $(NF-1)  indicates the second to last column
- $NF      indicates the last column

Awk can do simple maths as well. Let's see one such example:
```bash
awk '{print $1"*"$1,"=",$1*$1}' a.txt
```
shows:
```
1*1 = 1
2*2 = 4
3*3 = 9
4*4 = 16
```
given `a.txt` has 1,..4 in a separate line.

### Hello World! - command line
When an AWK program contains the `BEGIN` pattern without another special pattern, AWK will not expect any further command line input and exit.
```bash
awk 'BEGIN { print  "Hello World!"  }'
```
Now let's make helloworld.awk file with the same contents as above and execute the it as `awk -f helloworld.awk`.

## Getting Started with `awk`, a powerful text-parsing tool
Awk is a text-parsing tool for UNIX-like systems, it can also be called a programming language on its own because it contains the functions ability.

We work on this data file: colors.txt
```
name       color  amount
apple      red    4
banana     yellow 6
strawberry red    3
grape      purple 10
apple      green  8
plum       purple 2
kiwi       brown  4
potato     brown  9
pineapple  yellow 5
```

Awk's basic syntax:
```bash
awk [option] 'pattern {action}' file
```
### printing a column
In awk, the `print` function dsiplays whatever you specify. There are many predefined variables you can use, but some of the most common are integers designating the columns in a text file.
```bash
$ awk '{print $2}' colors.tx                    // colors.txt is the file location
```
$2 denotes the second column. `print $0` will print all the columns.

### Conditional selection of the columns
For example the following will look into the col2 and see if it has yellow matching and prints all the col1 contents for it.
```bash
awk '$2=="yellow"{print $1}' colors.txt
// shows 
banana
pineapple
```
The following ones looks in $2 for apporximate matches of the letter p followed by any number (one or more) characters and followed by letter p again and then print all the columns denoted by $0.
```bash
awk '$2 ~ /p.+p/ {print $0}' colors.txt
```
To print with condition that the third column containing an integer greater than 5, but print only from both col1 and col2
```bash
awk '$3>5 {print $1, $2}' colors.txt
```
### Field Separator ( comma, whitespace, etc)
Let's see how awk separates comma separated file. By default, awk uses whitespace as the field separator, though. So, to check let's first create **colors.csv** file now as:
```
name,color,amount
apple,red,4
banana,yellow,6
strawberry,red,3
grape,purple,10
apple,green,8
plum,purple,2
kiwi,brown,4
potato,brown,9
pineapple,yellow,5
```
awk can treat the data in exactly same way, as long as you specify which character it should use as the field separator in your command. So, use `-F` option to define the delimiter.
```bash
awk -F"," '$2=="yellow" {print $1}' colors.csv
```

### Saving output
Using output redirection operator, we can easily save the output of our search and filters. Like:
```bash
awk -F"," '$2=="yellow" {print $1}' colors.csv > output.txt
```
This will create the output.txt file that contains the filtered data.

### Search Pattern
Most of the time we need searching certain patterns through the text. To do that awk also supports the **regular expressions** to create such patterns.






## Common awk work we do:
1. How to filter the list of files greater than some sizes using `ls` and `awk`?
    - To first list the files in the directory `ls -ltr` // more detailed view with size also shown
    - Now we do selection of output based on file sizes greater than some value we are interested in: `$ ls -ltr | awk '$5 > 4000'`
2. How to cp the filtered list of files from above command using `ls, awk, cp`?
    - Make the script file that does filtering and cp commands as well. `ls -ltr /source_dir/ | awk '$5>1000 {print "cp " $9 "/target_dir/"}' > script_file.sh`
    - Then, just run you script by first making it scriptable as; `chmod +x script_file.sh` and `./script_file.sh`.
3. Justin Frantz email: First filter the condor area using your size file and only your required files and save it in text file and just split this large file into xaa, xab, etc
```
ls -ltr /sphenix/user/jfrantz/caloCalib/framew/condor/v14/*piemc.root | awk '$5 > 1866885 {print $9}  '>> listAll.txt
        // v14 have other several similar folder v14b, v14c, v14d. So run above code 3 more time (total 4 times) to include all v14* folders
        // this will create one giant "listAll.txt" file which already contains the path location of the files I need
split -l 5000 listAll.txt               // will split the big file into small chunks named like xaa, xab, xac, ...

```
The above method I did is fine, but it is still taking some time for doing the first step, so JF has some faster method to share:
```
ls -ltr /sphenix/user/jfrantz/caloCalib/framew/condor/v14/ > allall_ls_ltr_out.txt
cat allall_ls_ltr_out.txt | grep piemc > all_piemc_ls_ltr_out.txt
cat all_piemc_ls_ltr_out.txt | awk '$5 > 1888667 {print "/sphenix/user/jfrantz/caloCalib/framew/condor/v14/"$9}' > listAll.txt

// combining 
cat allall_ls...txt | grep piemc | awk '$5 > .....
```






## xargs
It is a command line command, it take output of a command and passes it as argument of another command. If no command is specified, xargs executes echo by default. Because many commands like echo, rm, mkdir don't accpet the standard input as agruments, using xargs we can force them to do it.

**xargs** reads items from the standard input, delimited by blanks and executes the command one or more times with any initial-arguments followed by items read from standard input.

Do you need to string some linux commands together, but one (mkdir, rm, etc.) of them doesn't accept the piped input? `xargs` can take the output from one command and send it to another command as parameters (or arguments).
```
// to output all the output from previous command into single line
$ ls -ltr | xargs       // default echo command is exectued

// to make the folders using mkdir
$ echo 'one two three' | xargs mkdir        // giving mkdir inputs from previous output
$ ls
one two three

// to wc the multiple files as once
$ ls -ltr | xargs wc

// to create a multiple files
$ echo 'one two three' | xargs -p touch      // -p option lets to confirm before final execution


```

# The AWK Programming Language: Tutorials

[Book](http://ia803404.us.archive.org/0/items/pdfy-MgN0H1joIoDVoIC7/The_AWK_Programming_Language.pdf)

Suppose you have a file name **file.txt** that contains the data like name, pay rate, and hours worked. Now you want to see name, and total to pay. i.e you have this: Beth,4.00,0 - one entry. Then you want to do:
```
awk '$3>0 {print $1, $2*$3}' file.txt
```
The part inside the quote is a complete program. Practice more from this book!! Good luck











# Examples: Explained the real example that is useful:
## grep:
1. How to ignore some words doing search using grep?
```
grep Exception logFile.txt | grep -v ERROR
```
above we first search inside logFile.txt the lines that matches the word Exception, but then with these lines we want to search only those lines that don't includes ERROR word in it, the `-v` option is really doing ignoring the pattern we say (ERROR) word.

2. How to count the occurrence of a word in a file using the grep?
```
grep -c "Error" logFile.txt             // here we want the count of word Error inside the logFile.txt
```
3. How to use egrep to search the pattern?
egrep is more powerful version of regular grep, as it has more functionality that helps to do more or regular expressions
```
egrep 'Error|Exception' logFile.txt 
```
We can use `|` option to search for either Error or Exception by executing just one command

4. How to do case-insensitive searching using grep?
```
grep -i error logFilet.txt
```
Can search any match like Error, ERROR, ERRor, etc.

5. How to do a recursive search in a directory using grep?
```
grep -R store *
```
searching current dir and all its subdirectory either a file or folder name "store"

6. How to display files names which contain given word?
```
grep -l ERROR *.log
```
searching files that has ERROR in it within all log files in the current directory

7. How to display the lines numbers that match the pattern using grep in the file?
```
grep -n ERROR logFile.txt
```
shows in which line "ERROR" occurred in the logFile.txt

8. How to search the whole word in a file using grep?
Sometimes you just want to search instances where the word is alone without inside some mixture.
```
grep -w ERROR logFile.txt
```
searches all instances of 'ERROR' but not search in 'sysERROR'.


































