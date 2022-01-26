# Bash Scripting Tutorials for Beginners

## **Bash**
    Bash is a command language interpreter. By default in LINUX/UBUNTU I have bash interpreter.

## **Shell**
    Shell is a macro to interact with the command execution

## **Scripting**
    Scripting means writing a macro to task you do repeatitively.

> Bash scripting is a must skill for any Linux system administration job; and it is implictly required

## Tyring your bash shell
try `date`, `cal`, `pwd`, `ls`, etc followed by `ENTER` key. You will see that your bash shell will output somethings

## What is Scripting?
Imagine that you have to type all of the above code daily for your job, then this very simple looking task already starts to look like the tedious ones
and likely to be error-prone in the future typing. Ideally, you would want to have a script written and you just run that script file daily.

Lets make one script file for above task:
- open editor and make `task.sh` file that contains exactly what above codes you type one line by line
- Make this file executable using `chmod` command with option `+x` `chmod +x task.sh`
- Run the file `./task.sh`

There you have your first script file. Although basic, it will do your work.

*Remember* our shell was bash shell (other types of shell do exists C shell), but in our script we never told this file to run
in `bash` shell or to any. Luckily, your computer assume it is bash but a good programming habit is to tell it explicity on each script file. Like,

```
#!/bin/bash

date
cal
pwd
ls
```
We can know which interpretar we have in our system by doing `echo $SHELL` should give `/bin/bash`.

You can make a comment in the bash script file using `#` and put your comment in that line. The only exception is
for the sha-bang first line, however, in that case it treats as a valid command.

Any command that you put in the command line will do either of three things. Either produce `stdout`, `stderr` or do nothing.
You can redirect the each output to check what your command did you can do: `>` to redirect `stdout`; `2>` to redirect 
`stderr`, `&>` to redirect `stdout` and `stderr`
