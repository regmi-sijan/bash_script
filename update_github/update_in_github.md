### How to update in github? 
Once we logged in the server (doing ssh or via no machine), then to update code to github we do following task.

Clone the repository
#### git clone git@github.com:username/repository.git

Navigate to the repository folder
#### cd repository

Copy or move files (or update) into the repository folder
#### cp /path/to/source/file .

Check status
#### git status

Add files to the commit
#### git add .

Commit the changes
#### git commit -m "Added project files"

Push changes to GitHub
#### git push origin main

###### When above task is done, then we must provide the user name (of github) and password (token key). Then, codes will be updated as per our requirement. We might have to perform additional steps depending upon situation.

### To update code from the github without loosing local changes we can follow these instructions:
1. "git stash" to temporarily save the local modifications
2. "git pull orgin main" to pull the code form github and update the local code
3. "git stash apply" update the stash changes
4. "git add ."
5. "git commit -m "XXXXXX"" {4 and 5 are to commit the changes

These steps are essential for making those/local chanegs to the code.

