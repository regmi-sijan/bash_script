How to update in github? Once we logged in the server (doing ssh or via no machine), then to update code to github we do following task.

### Clone the repository
git clone git@github.com:username/repository.git

### Navigate to the repository folder
cd repository

### Copy or move files (or update) into the repository folder
cp /path/to/source/file .

### Check status
git status

### Add files to the commit
git add .

### Commit the changes
git commit -m "Added project files"

### Push changes to GitHub
git push origin main

