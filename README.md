# UNIX/LINUX commands and Bash Scripting

## Reference Lists :book:

* [Coursera IBM Course](https://www.coursera.org/learn/hands-on-introduction-to-linux-commands-and-shell-scripting)
* [tutorials point](https://www.tutorialspoint.com/unix/index.htm)
* [Unix tutorial for beginners](http://www.ee.surrey.ac.uk/Teaching/Unix/)
* [Learning Bash Scripting (LinkedIn)](https://www.linkedin.com/learning/learning-bash-scripting-17063287)
* [Advanced Bash-Scripting Guide](https://tldp.org/LDP/abs/html/index.html)
* [the-art-of-command-line](https://github.com/jlevy/the-art-of-command-line)
* [AWK textbook](http://ia803404.us.archive.org/0/items/pdfy-MgN0H1joIoDVoIC7/The_AWK_Programming_Language.pdf)

A **shell** is a powerful user interface for UNIX-like operating system. It can interpret commands, and run other programs.

## Starting with some basics

```bash
pwd                   // tells you the current working directory with the complete path to reach from root dir
ls                    // lists files and directories in your current dir
ls -a                 // -a option allows you to list even the hidden files and folder
mkdir <dir_name>      // makes the dir_name folder in current dir
cd dir_name           // change your directory to this new dir_name folder
cd ..                 // brings you one directory up (going backward in directory tree)
cd -                  // toggles betweent the current and last directory you visited
```

**Tips**: If you want to just skim around different directories without actually changing your directory, you can do so using `ls` command. You can just `ls` the directories you want to quickly peek into and sort of use **up and down** arrow keys to quickly move back and forth to previoulsy visited areas. I always use this method to go into the very deep of the directory root and when I see where I want to go, I finally do up key and **cd** into this directory.

## Working with files
```bash
cp                            // copy file
cp file1 file2                // makes copy of file1 in current dir and names if file2
cp /path/of/file ./           // copies the file from this path to your current dir
mv                            // mv file (use to rename file as well)
mv file1 file2                // renames file1 to file2 (same contents inside)
touch                         // create empty file, or mostly used to update the timestamp a file
chmod                         // change/modify file permissions (more later)
wc                            // get counts of lines, words, characters in file (mostly used to count line with -l option)
grep                          // return line(s) in file matching the pattern
rm <file_name>                // removes file_name
rmdir <dir_name>              // removes dir_name
rm -rf <file/dir_name>        // so powerful command to remove almost anything (files, directories)
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
```bash
-n              // along with the matching lines, print the line number also
-c              // get the count of matching lines
-i              // ignore the case of the text while matching
-v              // print all lines which do not contain the pattern
-w              // match only if the pattern matches whole words
```
One more example:
```bash
grep -v login /etc/passwd               // prints all lines from the /etc/passwd file, which do not contain the pattern login
```
* Using **find**: `$ find  // finds files in the current direcotry tree (this and all the directory inside of it)`.

## Compression and archiving
```bash
tar       // archive a set of files
      (allows you to copy multiple files and directories into a single archive file)
zip       // compress a set of files
unzip     // extract files from a compressed zip archive
```

## Networking
```bash
hostname      // prints hostname
ping        // send packets to URL and prints response, (CTRL-C) to cancel it
ifconfig      // display or configure system network interfaces
curl          // display contents of file at a URL
wget        // download file from URL
```

`$ df -h  (shows amount of disk space available on the file system)` extra one to know more.

Now, let's discuss some of the important commands with more details and examples.
## tar
This command lets you to copy  multiple files and directories info into a single file. Some of the options choices are:
```bash
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
```bash
--r    // read
--w    // write
--x    // execute
```
To see current permissions, `ls -l` or if you like to see the permission for a particular file `ls -l fileName.txt`, you should see something like
```bash
rw--r--r--          // (owner read and write, group owner read only, others read only)
```
Then we can now change the permissions of the file as per our requirements.

`r, w, x`       // representing read, write, and execute permissions respectively
`u, g, o`       // user categories owner, group, other
`+, -`          // grant or revoke operations

The command below removes read permission for usdoi.txt file (this permission is updated for all the user groups):
```bash
chmod -r usdoi.txt
```
Similarly, to add read permission to this file:
```bash
chomod +r usdoi.txt
```
To remove teh read permission for others category:
```bash
chmod o-r usdoi.txt
```
## Processes and Jobs
Running programming in your computer that has a unique **PID**. Just do `$ ps`. Process are sometimes running foreground, background or suspended. Some process will take long time and will hold the terminal from doing other jobs. So we need to learn how to put to **background** some of the tasks/jobs.

**Running background processes**
To background a process just type `&` at the end of the command line. Example:
```bash
sleep 10
```
will wait given 10 seconds before continuing and giving you terminal to work. But you can run this sleep in background;
```bash
sleep 10 &
```
And that will take care of the commands and take them to background. Similarly, sometimes `emacs` take away your terminal and so you do
`&` at the end in that case as well.

**Backgrounding the current foreground process**: already running thing can be also put into the background
```bash
sleep 1000        // running sleep
Ctrl+z              // suspend the process in the foreground to the bkg
bg                // take the foreground program to the background
```

**Killing a process**
Sometimes you require to kill the process because it went to the infinite loop.
To kill the program running in the foreground `ctrl+c` will work.

To kill the program suspended or background process:
```bash
sleep 100 &
jobs          
kill %4           // here 4 is the job number let's say
```

**ps (process status)**
You could kill using PIDS
```bash
sleep 1000 &
ps        // will list the PID to you
kill PID_you_want
```
Type `ps` again to see its status. If the process refuses to be removed use `-9` option as
```bash
kill -9 PID_you_want
```

## wc
`wc usdoi.txt` prints the number of lines, words, and character in a file. 
* To print only the number of lines: `wc -l usdoi.txt`
* to see the number of words `wc -w usdoi.txt`
* to see the number of characters `wc -c usdoi.txt`

## Networking
`hostname -l` to view ip address of the host

To test if the host is reachable:
```bash
ping www.google.com             // ctrl-c to cancel
```

To display contents from the web on the screen:
```bash
curl https://......./*.txt
```

To access given URL and save it in the current directory
```bash
curl- o https://..../*.txt
```

To view permission of dir-name
```bash
ls -ld dir_name
```

## Command line
```bash
## System Basics:
#---------------------------------------------------------------------------
echo $PATH          # displays what PATH environment variable is pointing to
which ls            # shows the path of the file where this command lives
sudo locate *.h     # locates the file path for all .h files
find *.sh           # finds the file
find / -name *.sh   # finds inside / root folder
grep text_to_search file(s)  # search text in file(s), and returns those lines from all files
    # let's see other various options
    grep -c   # print count of matching line rather than returning those lines
    grep -h   # not print all the files if found in many files
    grep -i   # ignore case
    grep -l   # print name of files that matches
    grep -n   # print line number of match
    grep -v   # invert the match i.e. opposite of what we search
ls /path/to/list    # lists the file and folders
ls -ltr <dir>       # more information while listings
ls \                # waits for command next line, backslash is used for command continuation
> /                   # like doing: $ ls /
apropos copy        # to see if any commands that does similar thing is available
                      # apropos helps to find commands we might need
man cp              # after you found the command that might be useful
                    # learn more about it using man command to see it's manual page
cat /etc/*release   # shows about the system installed
hostnamectl         # more system info.
uname -a            # similar as above info.
uptime              # shows how long this system has been booted
df -h               # shows how much disk available in human-readable format
free                # shows the memory usage
top                 # to see which app is using cpus

echo h{a,e,i,o,u}llo  # prints all possibility
echo h{a..z}llo       # range from a-z
echo h{z..a}llo       # reverse range from z to a
echo h{0..10}llo      # range of numbers as well
echo {0..100..2}      # 0 through 100 interval 2

echo "It is " $(date) "today."  # $(date) gives todays datetime
history                         # to show bash command history
!55                             # runs the 55th command in your command history

pwd                              # prints current working directory
ls <dir>
cd <dir>                         # change to <dir> directory
cp <source> <destination>        # copies source into destination
mv <source> <destination>        # two-jobs: 1. rename source to dest, 2. moves also
rm -rf <dir/files>               # very powerful delete of any files or directories
mkdir <dir_name>                 # creates directory

# data manipulation:
cat file.txt                     # to view the file
less file.txt                    # better way to view the file
touch file.txt                   # creates (if not present), else updates timestamp of the file
head -n 5 file.csv                 # can view first 5 lines in csv file
tail -n 5 file.csv                 # can view last 5 lines in csv file
cut -f 2-5, 8 -d , file.csv        # select column from csv file, col 2-5, and 8 with delimeter ,

## Combining tools
head -n 5 file.csv > file_five_rows.csv    # send the output of one command to another
        # > command works for every shell command that produces output
head -n 5 file.csv | tail -n 3      # pipe or chain commands together
        # pipe symbol tells the shell to use the output of the command on the left
        # as the input to the command on the right
cut -d , -f 1 file.csv | grep -v Date | head -n 10    # chaining commands
wc file.txt    # prints the count of number of characters, words, and lines in a file
  # -c, -w, -l options prints only the respective numbers
cut -d , -f 2 seasonal/winter.csv | grep -v Tooth | sort | uniq -c  # see how sort and uniq is added here
ctrl + c    # to stop running a program
ctrl + z    # send the process into background

# Batch Processings:
echo $HOME  # /home/shyam
    # other environment variables are: PWD, SHELL, USER, and so many
    # env. variables are written in UPPERCASE as standard
    # these variables are available all the time
set | less       # to list all of them and see one page at a time
printenv | less  # same as above

# Bash output redirection
echo {a..z}{a..z}{0..9} | set     # shows combination of all possible 3 characters
echo {a..z}{a..z}{0..9} > output  # instead of printing sends to the file output
    # note with > redirection, everything will be wiped and put new thing in output
    # instead if you want to append, you can do >>
echo {a..z}{a..z}{0..9} >> output
wc < output         # re-direction from file to the wc command
    # notice the < direction of pointing
# 0 is stdin, 1 is stdout, 2 is for stderror
find / -name "linux" > out 2> error     # success will go to out, permission denied goes to error

# bash expansion and substituion
touch file_{1..100}.txt       # quickly create 100 files with expansion
echo {1..100..3}              # every 3rd items from 1 to 100
mkdir -p stuff/{a..z}/{1..100}{z..a}  # creates giant web/tree of folders with one command

# bash aliases
# use alias keyword to create alias
alias ll='ls -ltrh'    # for nicer long listings
alias ll   # to see what command it's set up to
unalias ll # after you are done with it, to remove it
```

# Bash Scripting
Bash is a shell, a program that let's interact with system. Bash is more popular system, available to many platforms.
* list of commands interpreted by a scripting language, scripting language are not compiled but interpreted during the run-time, so it is slower in running! but development of the code is faster
* commands can be entered interactively or listed in a text file
* used to automate processes

It is a executable text file with interpreter directive, aka **shebang** directive `#!interpreter [optional-args]`. Here, `interpreter` is a path to an executable program,
`optional-arg` is s single argument string.

For **bash** shell: `#!/bin/bash`. Let's write down a simple *hello_world* script that will print hello world
```bash
touch hello_world.sh
echo '#!/bin/bash' >> hello_world.sh
echo 'echo Hello World' >> hello_world.sh       // >> is the redirection operator to append to the file
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
```bash
set | head -4         // set will list all variables, but head -4 will restrict to only 4 of them to see
```

How to define shell-variables: **$ var_name=value**
```bash
GREETINGS="HELLO"            // we normally do all caps for the variables, and no spaces around = sign
echo $GREETINGS       // to see the value of this variable, we put $ sign infront of it
```

```bash
**$ unset var_name**  // deletes var_name `$ unset GREETINGS`, then no longer now available
```

## Environment Variables
They are all CAPITAL letters. It has extended scope. There are number of default environment variables, but you can also upgrade shell variables into the environment variables using **export**. Like **export var_name**.
```bash
$ export GREETINGS
```

To list all of the environment variables: `$ printenv | less` to see in easier *less* way.
```bash
$ printenv | grep "GREE"     // env will list all, grep GREE will list only those that starts with GREE
```

## Some useful features of the Bash shell
## Metacharacters
```bash
 #                              // precedes a comment
 ;                              // command separator `$ echo "Hello"; whoami` will exectue both commands one after another
 *                              // wildcard one or any number of times
 ?                              // wildcard for only one number of time
 \                              // escape character `$ echo "\$1 each"` will print $1 as a literal text
 double quote " "              // evaluates the metacharacter as normal, need escape to avoid metacharacters
 single quote ' '              // interpret everything literally, don't need escape for other metacharacters
```

## I/O redirection
```bash
>               // redirects output (from terminal) to a file, it also creates a file if it doesn't exist already `$ echo "hello" > hello.sh`
>>              // instead of deleting and adding, this will append to the end of the file
2>              // redirects standard error to file
2>>             // appends std. error to file
<               // redirects file content to standard input
```

Let's go through one example:
```bash
echo "line1" > eg.txt                // creates eg.txt and adds line1 in line 1 of the file
cat eg.txt                            // to see what's in the line1
echo "line2" >> eg.txt                // appends line2 in line 2 of the file
cat eg.txt                            // verify if it is the case

garbage       // will throw an error: garbage: command not found
garbage 2> err.txt    // we will sometime like to save what errors is our command throwing at us (saving in a file)
```

## Command Substitution
Replace command with its output. `$(command)`. It stores the output of one command as the variable values. Example:
```bash
here=$(pwd)           // save the output generated by command pwd in a variable
echo $here            // indeed here variable created with the value of pwd
```

## Batch mode vs. Concurrent mode
**Batch Mode**: commands run sequentially     ` $ command1; command2`
**Concurrent Mode**: commands run in parallel   `$ command1 & command2`  // & puts command1 in background and runs command2 in foreground and running

## Using Bash:
```bash
bash --version    # to show which version installed
echo $SHELL       # to check if bash is currently active

# pipe and re-direction
cat longFile.txt | less                # pipe output to less, so you can see page by page
cat longFile.txt | wc                  # to count line, words, characters using wc
ls > list.txt                          # sends all the output to list.txt, replacing old contents
ls >> list.txt                         # instead for replacing, we could append
find / -name "Linux" >output 2> error  # send good output to output, errors to error file
    # 2> is needed here 2 to tell that we want to re-direct the error
cat < file.txt             # input re-direction to give input from file to cat command
    # note the < where it is pointing and how the output is flowing.

# bash built-ins, or command
echo Hello There   # echo is built-in, it ends with newline, nice thing!
command echo hello # to run command echo version
builtin echo hello # built-in version
command -V df
    df is /usr/bin/df   # this means it is built-in
help       # to list all built-ins
help echo  # to see more about echo built-in

# Bash expansion and substitution
echo ~     # shows your home directory, tilde expansion
echo /tmp/{one,two,three}/file.txt    # creates one,two,three i.e. specified folders
echo c{a,o,u}t                    # again uses specified character in between
echo {1..100}                     # shows 1 to 100 like a range based expansion
echo {1..100..2}                  # expansion but with step of 2
echo {100..1}                     # reverse order
echo {01..100}                    # keeps the padding same: 001, 002, 003, ... ,099, 100
echo {a..z}
echo {Z..A}
echo {a..z..2}
touch file_{01..12}{a..d}.txt     # creating some pattern/sequential type files instantly
echo {cat,dog,fox}_{1..5}
# parameter expansion
a="Hello World"
echo $a          # this is a parameter expansion
echo ${a//e/_}   # readin variable, search e, replace with _
echo ${a:6}      # print after 6th and after characters
echo ${a:6:3}    # after 6th, just print 3 characters
# command substitution
uname -r                            # to see release verion of the kernel
echo "The kernel is $(uname -r)."
echo "The Python version is $(python -V)." # see how we used ()  parenthesis
# arithmetic expansion
$(())     # two parenthesis
echo $((2+2))  # shows 4
echo $((4-2))  # 2
echo $((4*2))  # 8
echo $((4/5))  # 0, bash only does integer work
echo $((5%4))  # 1, modulo % gives remainder
```

## Programming with Bash
To do work that needs repetitive task, it is desirable to put them in a file, so it will be less error prone, and also faster to do. **One-liners** are one-line small bash command to try if that works for you. They are usually many commands presented in a one line connecting them with a pipe symbol or commands are separated by semi-colon. Can be very long (even wrap), but there's no newline until the end. And, these one-liners are often kept in saved docs so whenever they need it they can use it faster no need to re-write again and again.

To write bash script, first write the shebang line (to tell which program to run this script, can be any like python, perl, etc.). Shebang has to be the first line, and we can't even write comment in the first line. Let's make `myscript.sh` script that does very simple "hello there" output in the terminal.
```bash
#!/usr/bin/env bash
echo "hello"

# this is a comment
echo "there"
```
**echo** command is the most used command and used for displaying things in the terminal or directed elsewhere. Let's see some usage of echo command.
```bash
echo hello
>> hello
echo hello world
>> hello world
worldsize=big   # defining a variable
echo hello $worldsize world
>> hello big world
echo "The kernel is $(uname -r)."   # double quote is better
>> The kernel is <shows_your_kernel>.
echo -n   # gives no newline, needs sometime
```

**variables** allows us to store and retrieve values by name. Bash variables are special case of parameter substitution. Variables are named with alphanumeric characters. There should be **no spaces** on either side of the equal sign. Variable names are case-sensitive. Many times we use lowercase names for variables like: `mygreeting=Hello`. Uppercase is good to put for the environment and system variables.
```bash
mygreeting=Hello
mygreeting2="Good Morning!"
number=16
echo $mygreeting
>> Hello
declare -r myName="Shyam Chauhan"   # it won't let change the value of var later
echo $myName
>> Shyam Chauhan
```

**Working with Numbers** we can do arithmetic expansion that returns the result of mathematical operations `$((...))` or arithmetic evaluation performs calculations and changes the value of variable `((...))`. Bash supports six different airthmetic operations `+, -, *, /, %, **` as addition, subtraction, multiplication, division, modulo, exponentiation respectively. Note only does integer division (No float in Bash).
```bash
echo $((4+4))
>> 8
echo $((8-5))
>> 3
echo $((2*3))
>> 6
echo $((8/4))
>> 2
echo $(( (3+6)-5*(5*2) ))
>> -41
a=3
((a+=3))
echo $a
>> 6
((a++))  # also has ((a--))
echo $a
>> 7
declare -i b=3   # to make b as int always
echo $b
>> 3
b=$b+4
echo $b
>> 7

# to get random numbers
echo $RANDOM
echo $(( 1 + RANDOM % 10 ))    # can be thought as random bet 1 and 10
```
To do more precise calculations, we need to use `bc` or `awk`.
```bash
declare -i c=1
declare -i d=3
e=$(echo "scale=3; $c/$d"|bc)  # still just character and strings no number
echo $e
>> .333
```

**To Compare/Test things**:
```bash
# these are all single bracket notation, later we also see double bracket notation.
[ -d ~ ]   # to test if home is a directory
             # nothing returns means success
echo $?    # shows what was the output of last command, which is 0
[ -d /bin/bash ]; echo $?  # its a file, not dir
>> 1    # 0 is exit success, and 1 is exit failure
help test | less    # to see what you can check compare test with test
[ "cat"="dog" ]; echo $?   # not equal, exits 1
>> 1
[ 4 -lt 5 ]; echo $?   # true 0
>> 0
[ 4 -lt 3 ]; echo $?  # false 1
>> 1
[ ! 4 -lt 3 ]; echo $?  # not False -> True
>> 0
```
Double brackets test;
```bash
# extended double bracket test gives previous feature + additional things
# i.e. we can combine tests to make more logical
[[ 4 -lt 3 ]]; echo $?  # false
>> 1
[[ -d ~ && -a /bin/bash ]]; echo $?  # if home is dir, if bash binary file exists
>> 0
[[ -d ~ && -a /bin/mash ]]; echo $?  # no such file mash in bin, False
>> 1
[[ -d ~ || -a /bin/mash ]]; echo $?  # OR operator however is True
>> 0
[[ -d ~ ]] && echo ~ is a directory  # since True, will see output
[[ -d /bin/bash ]] && echo /bin/bash is a directory  # fails first part, no output
true && echo "True"   # built-in 'true' and 'false' also exists.
```

**Formatting and Styling text output**: `echo -e` interprets escaped characters like \t, \n, \a, and other control character so that we can have nice formatting and colors output. For example if we want nice two columns and nice formatted version of it, we can do the following:
```bash
echo -e "Name\t\tNumber"; echo -e "Shyam\t\t1234"
echo -e "This text\nbreaks over\nthree lines"
```
See below for the formatting with some colors:
```bash
#!/usr/bin/env bash

ulinered="\033[4;31;40m"
red="\033[31;40m"
none="\033[0m"

echo -e $ulinered"ERROR:"$none$red" Something went wrong."$none
```

**Formatting output with printf**: Outputs text using placeholders and formatting. See the difference:
```bash
echo "The results are: $(( 2 + 2 )) and $(( 3 / 1 ))"
printf "The results are: %d and %d\n" $((2+2)) $((3/1))  # it uses placeholder like %d
>> The results are: 4 and 3
#    %d is for digit
#    %s is for string
```

**Arrays in Bash** Lets us store related information together, bash supporst indexed and associative arrays.
```bash
# indexed array
declare -a snacks=("apple" "banana" "orange")
echo ${snacks[2]}  # its zero-based
>> orange
# add new element
snacks[5]="grapes"  # 4th pos can be empty
# append at the end
snacks+=("mango")
# to see all values in an array
echo ${snacks[@]}
# loop using for
for i in {0..6}; do echo "$i: ${snacks[i]}"; done

## assocative array: we can specify key and value to an array
declare -A office
office[city]="San Francisco"  # key-value pair
office["building name"]="HQ West"
# to access
echo ${office["building name"]} is in ${office[city]}
```

**Control Statements with the "if" keyword**:
* Allows us to control how script execution happens
* Run specified code based on conditions
syntax:
```bash
if ...
then
    ...
else
    ...
fi
```
Let's see some examples use in script.
```bash
#!/usr/bin/env bash

declare -i a=3    # -i makes in int type
if [[ $a -gt 4 ]]
then
    echo "$a is greater than 4"
elif [[ $a -gt 2 ]]
then
    echo "$a is greater than 2"
else
    echo "$a is not greater than 4"
fi
```

**Working with "while" and "until" loops**:
* while loops run as long as their condition is true
* until loops run as long as their condition is false
Syntax:
```bash
# while
while ...
do
    ...
done

# until
until ...
do
    ...
done
```
Examples:
```bash
#!/bin/env bash

echo "while loop"

declare -i n=0
while (( n<10 ))
do
    echo "n:$n"
    ((n++))
done

echo -e "\n Until Loop"

declare -i m=0
until ((m==10))
do
    echo "m:$m"
    ((m++))
done
```

**for loops**:
* For loops iterate through a list of items, running code once for each item
Syntax:
```bash
for i in ...
do
    ...
done
```
Example:
```bash
#!/usr/bin/env bash
for i in 1 2 3
do
    echo $i
done

# another:
for i in {1..100}
do
    echo $i
done

# C-style
for ((i=1; i<=10; i++))
do
    echo $i
done

# iterate thru array
#!/usr/bin/env bash

declare -a fruits=("apple" "banana" "cherry")
for i in ${fruits[@]}
do
    echo $i
done

# associative array
declare -A arr
arr["name"]="hari"
arr["age"]="42"
for i in "${!arr[@]}"
do
    echo $i: "${arr[$i]}"    # access key-value pair
done

# working with filenames
for i in *    # everything in current dir
do
    echo "Found a file: $i"
done

for i in $(ls)  # output of ls feed here
do
    echo "Found a file: $i"
done
```

**using `case`
* checks an input against a set of predefined values
* runs code when an input matches a condition
```bash
#!/bin/bash
animal=dog
case $animal in
    bird) echo "Avian";;    # ) is used to end the search value
    dog|puppy) echo "Canine";;   # ;; is used to end the case
    *) echo "No match!";;
esac  # back case, esac to end case
```

**using functions** Functions allow us to repeatedly call a piece of code.
syntax
```bash
fname(){
    ...
}
```
examples
```bash
#!/usr/bin/env bash
greet(){
    echo "Hi there, $1 What a nice $2!"  # $1 means it will take first argument passed to function
}

echo "And now, a greeting!"
greet Shyam Morning  # second argument takes place in place of $2 above

## next: using @ to take all values
numberthings(){
    i=1
    for f in "$@"; do
        echo $i: "$f"
        ((i++))
    done
}
numberthings /*   # list all in home dir with number at front
echo  # just for newline
numberthings pin birch maple spruce  # list these with numbers and items

## local variables lives only inside of function
var1="I am variable 1"

myfunction(){
    var2="I am variable 2"
    local var3="I am variable 3, but local"   # using local keyword at front
}

myfunction
echo $var1
echo $var2
echo $var3    # this won't print/show
```

**reading and writing text files**
* Write to files with output redirection operators (> and >>)
    * `echo "abc" > out.txt` overwrites the contents of out.txt
    * `echo "abc" >> out.txt` appends to the end fo out.txt
* Read from files input redirection (<) and read command
    * `while read line; do echo $line; done < in.txt`
```bash
#!/usr/bin/env bash
for i in 1 2 3 4 5
do
    echo "This is line $i" >> textfile.txt  # To write on file
done

## to read a file:
while read f
    do echo "I read a line and it says: $f"
done < textfile.txt
```

















































## command pipeline:
It is a feature of the shell, that helps us to combine different unrelated commands in such a way that one commands output is sent directly as input to the next command. This way, what is not possilbe with a single command can be made possible by connecting multiple commands.

Example: To count the total number of files and folders in your current directory:
```bash
ls | wc -l    // ls lists the files, wc -l now will count them and only prints the total line numbers

df -h | grep overlay  // df -h gives us disk usage info, and grep allows to show only the one that is overlay
```

How to list five (or any number) largest files in some directory or current dir:
```bash
ls -ls /bin | head -6         // -s option sorts the files from largest to smallest size
```

## Command line arguments
Command line arguments are a very convenient way to pass inputs to a script. Command line arguments can be accessed inside the script as `$1, $2, and so on`. `$1` is the first argument, `$2` is the second argument, and so on.

Let's see one example case: make a file name **wish.sh**
```bash
#!/bin/bash
echo "Hi $1 $2"
echo "$1 is your firstname"
echo "$2 is your lastname"
```

Next, you do compile and run:
```bash
chmod +x wish.sh              // making executable
./wish.sh Shyam Chauhan       // Shyam is first agrument given, Chauhan is second argument given
      prints: Hi Shyam Chauhan
              Shyam is your firstname
              Chauhan is your lastname
```

example2: let's make **dirinfo.sh** file:
```bash
#!/bin/bash
dircount=$(find $1 -type d | wc -l)             // counts directory in $1 argument provided later in command line
filecount=$(find $1 -type f | wc -l)            // counts file number
echo "There are $dircount directories in the directory $1"
echo "There are $filecount files in the directory $1"
```

Next, compile and run
```bash
chmod +x dirinfo.sh
./dirinfo.sh /tmp             // we want to see info of /tmp folder here
```

**Problem**
Display the count of all files whose name starts with 'c' in the /bin directory:

sol:
```bash
find /bin/c* -type f | wc -l
```

Write a Shell script named *latest_warnings.sh* that prints the latest 5 warnings from the */var/log/bootstrap.log* file

sol:
```bash
#!/bin/bash
grep warning /var/log/bootstrap.log | tail -5
```

## Scheduling jobs using Cron
This is helpful when you might need to run certain jobs automatically at certain times. Example- load scripts at midnight every night, backup scripts to run every Sunday at 2 pm or something.

**Crontab** file is a simple text file containing a list of commands meant to be run at specified times. It is edited using the *crontab* command.

Each line is crontab file has five time-and-date fields, followed by a command, followed by a newline character `\n`. The fields are separated by spaces.

```bash
minute  (0-50)
hour    (0-23, 0=midnight)
day     (1-31)
month   (1-12)
weekday (0-6, 0=Sunday)
```

To use crontab:
```bash
crontab -l            // -l option prints the current crotab jobs list
crontab -e            // if no jobs queued, create new crontab file (it should open this file in your default editor)
```

Let's say you put the following line in your crontab file:

**0 21 \* \* \* echo "Welcome to cron" >> /tmp/echo.txt**

This means it should run in **0** min **21 hr** everyday, and the output of this crontab file is finally sent to the */tmp/echo.txt* file as well.

Once you have created the crontab file, you might go back and check to see if the jobs are now schedule as you wish using `$ crontab -l`.

## Schedule a Shell Script
Let's create a simple shell script file name *diskusage.sh* that prints the current time and the current disk usage statistics.
```bash
#!/bin/bash
date
df -h
```

Then compile and run:
```bash
chmod +x diskusage.sh
./diskusage.sh
```

Let's schedule to run this scripts everyday at midnight 12:00 (0 in 24 hr clock). And, we want the output of this script be appended to */home/project/diskusage.log*:
```bash
crontab -e            // edit the crontab file now
```
Put the following line into crontab file:

**0 0 \* \* \* /home/project/diskusage.sh >> /home/project/diskusage.log**. The moment you put some commands into your crontab file, it is schedule as needed.

Then, `$ crontab -l` to confirm that the job has been put into the schedule.

## Remove the current crontab:
The `-r` option `$ crontab -r` causes the current crontab to be removed. Be cautious doing this as it removes your entire scheduled crontab jobs.


# The AWK Programming Language: Tutorials

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
```bash
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
```bash
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
```bash
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
#  $2 denotes the second column `print $0` will print all the columns.
```

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
```bash
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



## xargs
It is a command line command, it take output of a command and passes it as argument of another command. If no command is specified, xargs executes echo by default. Because many commands like echo, rm, mkdir don't accpet the standard input as agruments, using xargs we can force them to do it.

**xargs** reads items from the standard input, delimited by blanks and executes the command one or more times with any initial-arguments followed by items read from standard input.

Do you need to string some linux commands together, but one (mkdir, rm, etc.) of them doesn't accept the piped input? `xargs` can take the output from one command and send it to another command as parameters (or arguments).
```bash
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

Suppose you have a file name **file.txt** that contains the data like name, pay rate, and hours worked. Now you want to see name, and total to pay. i.e you have this: Beth,4.00,0 - one entry. Then you want to do:
```bash
awk '$3>0 {print $1, $2*$3}' file.txt
```
The part inside the quote is a complete program. Practice more from this book!! Good luck








# Real-World Examples Usages:
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































