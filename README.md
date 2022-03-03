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
> #     // precedes a comment
> ;     // command separator `$ echo "Hello"; whoami` will exectue both commands one after another
> *     // wildcard one or any number of times
> ?     // wildcard for only one number of time
> \     // escape character `$ echo "\$1 each"` will print $1 as a literal text
> double quote " "              // evaluates the metacharacter as normal, need escape to avoid metacharacters
> single quote ' '              // interpret everything literally, don't need escape for other metacharacters

## I/O redirection
