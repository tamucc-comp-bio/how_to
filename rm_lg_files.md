# prj_rotablue_data

---
# Removing Large Files from GitHub Repo

---

If you're encountering warnings from GitHub about large files in your repository, chances are, you need to undo the large files you added, committed and pushed to GitHub

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
   
1. Open an Ubuntu terminal and execute the following commands to install Git LFS:

   ```bash
   sudo apt update
   sudo apt upgrade
   curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
   sudo aptget install git-lfs
   ```

2. Set up Git LFS by running:

   ```bash
   git lfs install
   ```

## Track Large Files

3. Before committing large files, specify which files to track with Git LFS in this repository. For example, to track all MOV files:

   ```bash
   # Edit this path to be correct
   cd ~/prj_rotablue_data
   git lfs track "*.MOV"
   ```

   This will add the specified patterns to the `.gitattributes` file in your repository.

## Commit and Push

4. Add and commit the tracked files as usual, then push them to the repository:

   ```bash
   git add .
   git commit -m "Add large files with Git LFS"
   git push
   ```

## Migrate Existing Large Files

5. If you've already committed large files without Git LFS, migrate these files to LFS using:

   ```bash
   git lfs migrate import --include="*.MOV"
   git push --force
   ```

   **Note:** Use `--force` push cautiously, as it can overwrite history in remote repositories.

After completing these steps, your large files will be managed by Git LFS, and you should avoid warnings about file sizes when pushing to GitHub. Ensure that everyone collaborating on the repository has Git LFS installed and initialized.



### II. 
