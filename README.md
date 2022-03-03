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
#### tar
This command lets you to copy  multiple files and directories info into a single file. Some of the options choices are:
* -c      // create a new archive file
* -v      // verbosely list files processed
* -f      // archive file name

Example:
`tar -cvf bin.tar /bin` creates an archive of the entire `/bin` directory into a file named `bin.tar`
