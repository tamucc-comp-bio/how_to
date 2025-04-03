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

# START HERE: BE SURE YOUR COMPUTER IS PROPERLY SET UP AND HAS THE REQUIRED SOFTWARE

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

# IF YOU ARE CREATING A REPO FROM SCRATCH, START HERE

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

# IF THE REPO EXISTS AND YOU ARE CLONING or UPDATING IT, START HERE

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
  dvc remote modify myremote user <username> #There is no need to enclose the username in quotation marks.
  ```

 > [!NOTE]
 > In ODU-Wahab, the `<username>` is the string before `@wahab.hpc.odu.edu`. For example, the `<username>` for `klab@wahab.hpc.odu.edu` is `klab`. 
 

3. **Pull Data with DVC:** 

  This will download the `data/` and `intermediate_files/` folders from the DVC remote.

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

<details><summary>IX. Tracking Edits to Repo w/ DVC & GIT</summary>
<p>

0. **Navigate to your repo directory and make sure that you activate  your `dvc` environment in `conda`**

   ```bash
   cd /mnt/c/users/cbird/Documents/my_repo
   conda activate dvc
   ```

1. **Pull changes from github and the `dvc` storage servers before you start your work**

   ```bash
   git pull
   dvc pull # you will be prompted to enter your password (tamucc crest or odu wahab)
   ```
   
2. **Add New Data:**  
  - Save new files in directories managed by `dvc`, e.g. `data/` or `intermediate_files/` or ...
 
  - Track them with:

      ```bash
      dvc add data/ intermediate_files/
      ```
      
  - Save new files in directories managed by `git`, e.g. `scripts`, ...
 
  - Track them with:

      ```bash
      git add scripts
      ```
 
3. **Push Changes:**  
  - Commit code or metadata to Git:

      ```bash
      git commit -m "Update code and data"
      git push
      ```
 
  - Push data to the DVC remote:

      ```bash
      dvc push
      ```
 
4. **Sync Changes on Another Machine:**  
  - Pull Git updates:

      ```bash
      git pull
      ```
 
  - Pull data updates:

      ```bash
      dvc pull
      ```

</p>
</details>

---
