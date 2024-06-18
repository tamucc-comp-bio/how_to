## How To Set Up [Git Large File Storage](https://git-lfs.com/)

---

If you're encountering warnings from GitHub about large files in your repository, it's recommended to use Git Large File Storage (Git LFS) to handle these files efficiently. Below are the steps to install and use Git LFS on Ubuntu. You can also refer to the [Git Large File Storage Page](https://git-lfs.com/) for MacOS installation.

_*Before installing Git LFS, if you are encountering errors in pushing your commits to GitHub, then you should first [remedy the large files committed](rm_lg_files.md)*_

1. Open an Ubuntu terminal and execute the following commands to install Git LFS:

   ```bash
   sudo apt update
   sudo apt upgrade
   curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
   sudo apt-get install git-lfs
   ```

2. Set up Git LFS by running:

   ```bash
   git lfs install
   ```

3. Before committing large files, specify which files to track with Git LFS in this repository. For example, to track all MOV files:

   ```bash
   # Edit this path to be correct
   MYPATH=~/prj_rotablue_data
   
   cd $MYPATH
   git lfs track "*.MOV"
   ```

   This will add the specified patterns to the `.gitattributes` file in your repository.

4. Add and commit the tracked files as usual, then push them to the repository:

   ```bash
   git add --all
   git commit -m "Add large files with Git LFS"
   git push
   ```

5. If you've already committed large files without Git LFS, migrate these files to LFS using:

   ```bash
   git lfs migrate import --include="*.MOV"
   git push --force
   ```

   **Note:** Use `--force` push cautiously, as it can overwrite history in remote repositories.

After completing these steps, your large files will be managed by Git LFS, and you should avoid warnings about file sizes when pushing to GitHub. Ensure that everyone collaborating on the repository has Git LFS installed and initialized.

