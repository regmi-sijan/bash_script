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



