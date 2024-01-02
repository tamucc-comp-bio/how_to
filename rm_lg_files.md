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

1. Install Java Runtime Enviroment

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
   
2. Install [BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/)

   ```bash
   cd ~/Downloads
   
   # check the BFG Repo-Cleaner website to be sure that this is the newest version, update as necessary
   wget https://repo1.maven.org/maven2/com/madgag/bfg/1.14.0/bfg-1.14.0.jar
   sudo cp bfg-1.14.0.jar /usr/local/bin
   sudo cp bfg-1.14.0.jar /usr/local/bin/bfg.jar
   ```

3. Run [BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/) to remove large files from more than the last commit
   
   ```bash
   # Edit these variables to match your Repo and file size cutoff
   MYREPOSSH=git@github.com:tamucc-gcl/prj_rotablue_data.git
   MYREPO=prj_rotablue_data.git
   FILESIZE=50M
   
   cd ~/Downloads
   git clone --mirror $REPOSSH
   java -jar /usr/local/bin/bfg.jar --strip-blobs-bigger-than $FILESIZE $MYREPO
   cd $MYREPO
   git reflog expire --expire=now --all && git gc --prune=now --aggressive
   ```
   
   ```bash
   # if the large files were committed in the most recent commit, then manually undo them
   
   ```
   
