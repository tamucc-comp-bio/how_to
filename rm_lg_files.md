# Removing Large Files from GitHub Repo

---

If you're encountering warnings and errors from GitHub about large files in your repository, chances are, you need to undo the large files you added, committed and pushed to GitHub

0. _*To avoid data loss, make a copy of your local repo and the github copy of the repo*_

   ```bash
   # update variable to match your repo path
   MYREPOPATH=/mnt/c/Users/cbird/Downloads/prj_rotablue_data
   MYREPOSSH=git@github.com:tamucc-gcl/prj_rotablue_data.git
   MYREPONAME=prj_rotablue_data
   
   cp -r ${MYREPOPATH} ${MYREPOPATH}_backup_local
   cd $(echo $MYREPOPATH | sed "s/${MYREPONAME}//")
   git clone $MYREPOSSH ${MYREPONAME}_backup_github
   ```
   
   If something goes wrong below and you lose progress, then you can use

1. Manually Undo the large files in the last commit.
   
   If large files were committed in the most recent commit, then BFG Repo Cleaner can't touch them in the next steps.
   
   If the only large files were added in the last commit, then this step will get you back to where you can either employ git lfs or .gitignore to handle the large files.
   
   ```bash
   # this variable was set in step 0
   cd $MYREPOPATH
   
   ```
   
   Please note that undoing changes that have been pushed to a remote repository like GitHub can affect other collaborators if they have pulled your changes. Here's how you can do it:

    Undo the Push:
        First, you need to find the commit ID of the commit you want to revert to. You can use `git log` to see the commit history.
        Once you've identified the commit to revert to, use the `git reset --hard <commit-id>` command to reset your local repository to that commit.
        To reflect this change in the remote repository, you need to force push. Use `git push origin <branch-name> --force`. Be cautious with this command as it can overwrite changes in the remote repository.

    Undo the Commit:
        If you want to undo the commit but keep your changes, you can use `git reset --soft HEAD~1`. This command will undo the last commit but keep your changes staged.
        If you want to undo the commit and all changes, use `git reset --hard HEAD~1`. This command will delete all changes made in the last commit.

    Undo the Add:
        To unstage files (undo `git add`), you can use `git reset HEAD <file>` for specific files.
        If you want to unstage all files, use `git reset HEAD`.

   Remember, using `--hard` with `git reset` will permanently delete your changes. Always make sure you have a backup of your work before performing actions that can result in data loss.
   
   If these were the only unhandled large files, then you should now be able to use git lfs or .gitignore to address the large files before further adding committing and pushing.  
   
   _*However, if your large files were added to the repo prior to the last commit, then continue on*_
   
2. Install Java Runtime Enviroment

   ```bash
   # check if you have `java`
   java -version
   
   # if you don't have `java`, then install it
   sudo apt update
   sudo apt upgrade
   sudo apt install default-jre
   
   # confirm installation
   java -version
   ```
   
3. Install [BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/)

   ```bash
   # Edit this variable to match your repo
   MYREPOPATH=/mnt/c/Users/cbird/Downloads/prj_rotablue_data
   
   cd $(echo $MYREPOPATH | sed "s/${MYREPONAME}//")
   
   # check the BFG Repo-Cleaner website to be sure that this is the newest version, update as necessary
   wget https://repo1.maven.org/maven2/com/madgag/bfg/1.14.0/bfg-1.14.0.jar
   sudo cp bfg-1.14.0.jar /usr/local/bin
   sudo cp bfg-1.14.0.jar /usr/local/bin/bfg.jar
   ```

4. Run [BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/) to remove large files from more than the last commit
   
   ```bash
   # Edit these variables to match your Repo and file size cutoff
   MYREPOSSH=git@github.com:tamucc-gcl/prj_rotablue_data.git
   MYREPONAME=prj_rotablue_data.git
   FILESIZE=50M
   
   cd ~/Downloads
   git clone --mirror $MYREPOSSH
   java -jar /usr/local/bin/bfg.jar --strip-blobs-bigger-than $FILESIZE $MYREPONAME
   ```
   
5. Read the output from the last `bash` command and if appropriate, run the following to log the changes
   
   ```bash
   cd $MYREPONAME
   git reflog expire --expire=now --all && git gc --prune=now --aggressive
   git push
   ```
   
   Here's what each part of the process did:

    `git reflog expire --expire=now --all`: This command removes reflog entries (a log of where your HEAD and branch tips have been). By setting --expire=now, it tells Git to remove all reflog entries immediately. This is a preparatory step before garbage collection.

    `git gc --prune=now --aggressive`: The git gc (garbage collect) command cleans up unnecessary files and optimizes the local repository. The --prune=now option removes objects that are no longer in use. The --aggressive flag makes the garbage collection more thorough, potentially leading to better compression and cleaner storage, but takes longer to complete.
   

   
