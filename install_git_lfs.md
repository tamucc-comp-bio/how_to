## How To Set Up [Git Large File Storage](https://git-lfs.com/)

### I. Download the newest release for your computer from [here](https://github.com/git-lfs/git-lfs/releases?utm_source=gitlfs_site&utm_medium=releases_link&utm_campaign=gitlfs) and install it

If you're encountering warnings from GitHub about large files in your repository, it's recommended to use Git Large File Storage (Git LFS) to handle these files efficiently. Below are the steps to install and use Git LFS on Ubuntu. You can also refer to the [Git Large File Storage Page](https://git-lfs.com/) for MacOS installation.

0. Chances are, you need to undo the large files you added, committed and pushed to GitHub, so install [BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/)

   ```bash
   cd ~/Downloads
   # check the BFG Repo-Cleaner website to be sure that this is the newest version, update as necessary
   wget https://repo1.maven.org/maven2/com/madgag/bfg/1.14.0/bfg-1.14.0.jar
   sudo cp bfg-1.14.0.jar /usr/local/bin
   sudo cp bfg-1.14.0.jar /usr/local/bin/bfg.jar
   ```
   
   ```bash
   # if you don't have `java`, then install it
   java -version
   sudo apt update
   sudo apt upgrade
   sudo apt install default-jre
   java -version
   ```
   
   ```bash
   # if you need to remove the large files, then follow the instructions on the BFG Repo-Cleaner website
   cd ~/Downloads
   git clone --mirror git@github.com:tamucc-gcl/prj_rotablue_data.git
   java -jar /usr/local/bin/bfg.jar --strip-blobs-bigger-than 50M prj_rotablue_data.git
   cd prj_rotablue_data.git
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
