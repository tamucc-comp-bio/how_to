# Data Version Control (DVC) Setup Tutorial

![](https://dvc.org/img/logos/dvc.svg)

![](https://dvc.org/static/fc45be68b6d7ea2eae90eda3ff00ba1e/5887a/Hero%20Visualization.avif)

## Introduction

[**Data Version Control (DVC)**](https://dvc.org/) is an open-source tool that complements [Git](https://git-scm.com/) by providing version control for large data files and machine learning models. While Git excels at tracking text-based code and small files, it can struggle with large binary files. DVC solves this issue by storing only small metadata files in your Git repository, while the large data itself is pushed to remote storage (such as SSH, AWS S3, or a local directory). This way, you can keep your large datasets or intermediate files under version control without bloating your Git repository.

By using GitHub (or any other Git platform) in combination with DVC:
1. **Git** tracks your code, metadata files, and configuration.
2. **DVC** manages your large data files and shares them via a remote storage.

Below is a step-by-step guide to set up a project with Git + DVC, organize your files, and sync your code and data across multiple machines.

---

# BE SURE YOUR COMPUTER IS PROPERLY SET UP AND HAS THE REQUIRED SOFTWARE

Start here if you are using DVC for the first time. Before utilizing `git` and `dvc` your computer needs to have the dependencies installed.

1. If you are unsure whether your Windows/MacOS/Linux computer is properly prepped, consult [How to Set Up Your Computer for Computational Biology](https://github.com/tamucc-comp-bio/how_to/blob/main/howto_setup_computer.md)

   <details><summary>Expand for instructions</summary>
   <p>  
   You minimally need
   * linux/unix based os
     * mac os is unix based, so you're good
     * windows computers are not unix based, so install wsl ubuntu & windows terminal
   * github account
   * ssh keys
   * miniconda
   
   Just follow the instructions in the [how_to](https://github.com/tamucc-comp-bio/how_to/blob/main/howto_setup_computer.md)
   
   ---
   
   </p>
   </details>

2. Install DVC in a Conda Environment

      <details><summary>Expand for instructions</summary>
      <p>  
      
      The official installation instructions for DVC are not comprehensive, so follow the instruction here. 
      
      1. Create a conda environment called 'dvc'. 
      
        ```bash
        conda create --name dvc
        ```
      2. Activate the enviornment
      
        ```bash
        conda activate dvc
        ```
        
        Your terminal should now look something like this:
      
        ```bash
        (base) cbird@xps13plus:~/Downloads$ conda activate dvc
        (dvc) cbird@xps13plus:~/Downloads$
        ```
      
      3. Install `mamba` which installs much faster than conda
      
        ```bash
        conda install -c conda-forge mamba 
        ```
      
      4. Install `dvc`
      
        ```bash
        mamba install -c conda-forge dvc
        mamba install -c conda-forge dvc-ssh
        ```
       > [!NOTE]
       > If the above protocol didn't work, consult the [installation instructions for DVC](https://dvc.org/doc/install).  Windows computers, use "Install on Linux" in you Ubuntu terminal.
      
      ---
      
      </p>
      </details>

3. You need an account on our cloud server (e.g. `wahab.hpc.odu.edu`, `crest-login.tamucc.edu`) and need to be able to `ssh` into it

---

# CREATING A REPO THAT UTLIZES DVC 

If you are creating a new GitHub repo and you know you have large files that require `dvc` management, you can follow this general protocol.  However, if you just need to clone an existing repo, then skip down to the next major section.

<details><summary>I. Initial Setup</summary>
<p>  

1. **Install Required Tools:** 
Ensure you have installed: 
  - **Git** : [Download Git](https://git-scm.com/)
 
  - **DVC** : [Install DVC](https://dvc.org/)
 
 > [!NOTE]
 > On ODU-Wahab load DVC with `module load dvc` and prior to any DVC command use `crun.dvc <command>`
 
2. **Initialize a Git Repository:** 

      ```bash
      git init
      ```
 
3. **Initialize DVC in the Project:** 

      ```bash
      dvc init
      git add .dvc
      git commit -m "Initialize DVC"
      ```

---

</p>
</details>

<details><summary>II. Organize Your Directory</summary>
<p> 

Structure your directory like this:

  ```plaintext
        project/
        │
        ├── data/                # Raw and processed data (DVC tracked)
        ├── intermediate_files/  # Temporary or intermediate data (DVC tracked)
        ├── src/                 # Code (Git tracked)
        ├── output/              # Final outputs (Git tracked)
        ├── README.md            # Documentation (Git tracked)
        └── .gitignore           # To specify ignored files and folders
   ```

---

</p>
</details>

<details><summary>III. Configure DVC for `data/` and `intermediate_files/`</summary>
<p> 
  
1. **Track `data/` and `intermediate_files/` with DVC:** 

      ```bash
      dvc add data/
      dvc add intermediate_files/
      ```
 
2. **Store metadata in Git:** 
Add the `.dvc` files (but not the actual data) to Git:

      ```bash
      git add data.dvc intermediate_files.dvc .gitignore
      git commit -m "Track data and intermediate files with DVC"
      ```

---

</p>
</details>

<details><summary>IV. Set Up DVC Remote for Data Storage</summary>
<p> 

DVC remotes allow you to store large files externally.
 
1. **Choose a Remote Backend:** 
Supported options include S3, Azure, GCP, SSH, or local directories. For example: 
  - **Passwordless SSH** :

      ```bash
      ssh-keygen -t rsa -b 4096 -C "myemail@email.edu"
      ssh-copy-id username@your-server
      ```

  - **SSH Remote** :

      ```bash
      dvc remote add -d myremote ssh://username@your-server:/path/to/dvc-storage
      ```
 
  - **Local Directory Remote** :

      ```bash
      dvc remote add -d myremote /path/to/external/dvc-storage
      ```
 
2. **Push Data to the Remote:** 
      
      ```bash
      dvc push
      ```

---

</p>
</details>

<details><summary>V. Configure `.gitignore`</summary>
<p> 

Add the following lines to `.gitignore` to exclude DVC-tracked files from Git:

  ```kotlin
  data/
  intermediate_files/
  /.dvc/config.local
  ```

DVC automatically updates `.gitignore` when you `dvc add` files or folders.

---

</p>
</details>

<details><summary>VI. Commit Code and Non-DVC Files, add, and commit all remaining files (e.g., `src/`, `output/`, and other project files) to Git: </summary>
<p>
 

  ```bash
  git add src/ output/ README.md
  git commit -m "Add project code and outputs"
  ```

---

</p>
</details>

<details><summary>VII. Push to GitHub</summary>
<p>

1. **Create a GitHub Repository** : 
  - Go to [GitHub](https://github.com/) .
 
  - Create a new repository (e.g., `project-repo`).
 
2. **Add GitHub Remote:** 

      ```bash
      git remote add origin https://github.com/<username>/<project-repo>.git
      ```
 
3. **Push to GitHub:** 

      ```bash
      git push -u origin master
      ```

</p>
</details>

---

# CLONING A REPO THAT UTILIZES DVC

If you are cloning an existing GitHub repo, then follow these general instructions.

<details><summary>VIII. Cloning Repo w/ DVC Already Set Up</summary>
<p>

If you do not complete steps 1-3 in totality, then you will have to remove the repo from you computer and start from step 1 here.

1. **Clone the GitHub Repository:** 

  Clone the repo, then `cd` into it

  ```bash
  git clone https://github.com/<username>/<project-repo>.git
  cd project-repo
  ```
 
2. **Change User**

  If you are not the user who originally set-up the remote storage, you will need to change the userID which uses SSH to download the files. You need to have proper access to the remote storage location to use:
 
  ```bash
  dvc remote modify myremote user <usernameOnRemoteServer> --local #There is no need to enclose the username in quotation marks nor <>.
  ```

 > [!NOTE]
 > In ODU-Wahab, the `<username>` is the string before `@wahab.hpc.odu.edu`. For example, the `<username>` for `klab@wahab.hpc.odu.edu` is `klab`. 
 

3. **Pull Data with DVC:** 

  This will download the directories with large files from the DVC remote server.

> [!NOTE]
> To pull ODU-Wahab hosted files you must do this to only require a single password entry

  ```bash
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
  dvc pull
  ```

  Note that after you run dvc pull, you will be prompted for your remote server (wahab at odu or crest at tamucc) password several times.  Just keep typing it in, it is not rejecting the password you are typing.  The screen will look something like this:

```bash
dvc pull
Agent pid 2339
Identity added: /home/cbird/.ssh/id_rsa (cbird808@gmail.com)
Collecting                                                                                                   |0.00 [00:00,    ?entry/s]
(cbird@wahab.hpc.odu.edu) Password:

Collecting                                                                                                   |2.00 [00:12, 6.12s/entry]
(cbird@wahab.hpc.odu.edu) Password:

Collecting                                                                                                  |1.91k [00:17,  190entry/s]
(cbird@wahab.hpc.odu.edu) Password:

Collecting                                                                                                  |1.91k [00:21, 88.4entry/s]
Fetching
```

---

</p>
</details>

---

# WORKING IN A REPO THAT UTILIZES DVC

Once your repo is cloned, then follow these general instructions to properly track your progress and push/pull the changes to both GitHub and the `dvc` storage server.  

> IMPORTANT!
> If you create a new dir with large files that needs to be tracked by DVC, follow the instructions above, starting with step III.

<details><summary>IX. Navigate to Your Repo & Activate Your `dvc` Enironnment</summary>
<p>

  - To run `git` and `dvc`, you must be inside of your repo and you must activate the `dvc` conda environment that we created previously.  Keeping `dvc` in a conda environment prevents its dependencies from interfering with those of other python packages.

   ```bash
   cd /mnt/c/users/cbird/Documents/my_repo
   conda activate dvc
   ```

> NOTE!
> In the `conda activate dvc` command, it is assumed that you set `dvc` as the name of the environment in which you installed the `dvc` package.

---

</p>
</details>

<details><summary>X. Pull changes from github and the `dvc`</summary>
<p>
   
  - It's important to pull changes from github and the `dvc` storage servers before you start your work because others may have updated the repo
  - `git pull` updates code and .dvc pointer files
  - `dvc pull` gets the actual data files managed by `DVC`

   ```bash
   git pull
   dvc pull # you will be prompted to enter your password (tamucc crest or odu wahab)
   ```

   > NOTE!
   > If you are queried for another user's password, `ctrl-c` to cancel command then run `dvc remote modify myremote user cbird --local`, replacing `cbird` with your username

   > NOTE!
   > If you can't see the characters you are typing after hitting `ctrl-c` then hit `enter` key followed by typing `reset` (you won't see the letters) and hit `enter` key again.  Now you should be able to see the letters you type.

  - Example, don't copy and paste.
   
   ```bash
   (dvc) cbird@xps13plus:/mnt/c/Users/cbird/Downloads/spratelloides_delicatulus_phenotypes$ dvc pull
   Collecting                                                                                                   |0.00 [00:00,    ?entry/s]
   Fetching
   (cbird@wahab.hpc.odu.edu) Password:
   ```

   ```
   Fetching
   Building workspace index                                                                                    |1.91k [00:03,  548entry/s]
   Comparing indexes                                                                                          |1.91k [00:00, 52.0kentry/s]
   Applying changes                                                                                             |0.00 [00:07,     ?file/s]
   M       data_processed/
   M       data_raw/
   M       intermediate_files/
   3 files modified
   ```

---

</p>
</details>

<details><summary>XI. Conduct Your Work in the Repo</summary>
<p>

  - It's important to write your code and perform all work in the repo so that the file paths and changes you make are tracked and will work on any computer. Working in the repo ensures your relative file paths work for everyone on every machine

  - It's perfectly fine to work on your dir through Windows or Mac GUI, *EXCEPT DO NOT MOVE OR RENAME DIRECTORIES OR FILES INSIDE A DVC-TRACKED DIRECTORY IN GUI*.
      - If you want to reorganize a dvc-tracked dir, you need to do it from the command line and use commands like `dvc move` which will properly track the changes. Consult the DVC manual.
   
  - Save new files in directories managed by `dvc`, e.g. `data/` or `intermediate_files/` or ... All `dvc`-tracked dirs have a matching file that ends with `.dvc`.  

      ```bash
      # list the dvc dirs
      # be sure you are in the top level of your repo directory structure
      
      ls *dvc | sed 's/\.dvc//'
      ```

  > IMPORTANT!
  > Large files (> 50 MB) must be stored in directories tracked by `dvc`. Otherwise, GitHub will not accept them and it can be troublesome to fix your repo.

---

</p>
</details>

<details><summary>XII. Track the new files and edits by "adding" them to `dvc`</summary>
<p>
 
  - If you made changes to the dvc-tracked directories, then to track the changes, you do need to explicitly `dvc add` them

      ```bash
      # you could alternatively specify each of the directories managed by dvc  
      dvc add data_dvc intermediate_files_dvc data_processed_dvc
      ```

      ```bash
      # you could use this simple one liner to automatically add changes made to all dvc dirs
      # be sure you are in the top level of your repo directory structure

      ls *dvc | sed 's/\.dvc//' | parallel -j1 'dvc add {}'
      ```

      > NOTE!
      > If you do not have `parallel`, add it:  `sudo apt install parallel`


---

</p>
</details>

<details><summary>XIII. Track the new files and edits by adding & committing them to `git`</summary>
<p>
   
  > IMPORTANT!
  > Before adding changes to `git` you must be sure that your dvc-tracked dirs are specified in the `.gitignore` file 

   ```bash
   # list dvc dirs
   ls *dvc | sed 's/\.dvc//'
   
   # confirm the dvc dirs are listed in the .gitignore
   cat .gitignore
   ```

  - Save edits and new files in directories managed by `git`, e.g. `scripts`, ...

      ```bash
      # if the .gitignore contains all of the dirs tracked by dvc, then add all changes to git
      git add --all
      git commit -m "Update code and data"
      ```
 
---

</p>
</details>

<details><summary>XIV. Push changes to `dvc` server, then github</summary>
<p>
 
 
  - After pushing the changes to `git`, then push the `dvc`-tracked changes to the `dvc` server

      ```bash
      dvc push
      git push
      ```

---

</p>
</details>

<details><summary>XV. DVC Troubleshooting & Healthcheck</summary>
<p>
 
If the instructions above are not followed, you may get into a situation where the repo needs to be repaired.  YOu can show LLM like chatGPT the inputs and outputs from your terminal that led to the errors to try and resolve, but realize that it is possible to overwrite progress so proceed with caution.

Before and after you make changes, it can be useful to run the following commands to assess the situation.
 
  - Repo Health Check

      ```bash
      # 1. Workspace should be clean
      git status          # → “nothing to commit, working tree clean”
      dvc status          # → “Workspace is up to date.”
      
      # 2. Remote cache should be fully populated
      dvc status -c       # (-c = cloud) → “Everything is up to date.”
      # If it isn’t, just run:
      dvc push
      
      # 3. Basic sanity on the DVC setup
      dvc doctor          # shows version, cache dir, remotes; all should be “OK”
      ```

---

</p>
</details>
---
