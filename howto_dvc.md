# Data Version Control (DVC) Setup Tutorial

![](https://dvc.org/img/logos/dvc.svg)

![](https://dvc.org/static/fc45be68b6d7ea2eae90eda3ff00ba1e/5887a/Hero%20Visualization.avif)

## Introduction
[**Data Version Control (DVC)**](https://dvc.org/) is an open-source tool that complements Git by providing version control for large data files and machine learning models. While Git excels at tracking text-based code and small files, it can struggle with large binary files. DVC solves this issue by storing only small metadata files in your Git repository, while the large data itself is pushed to remote storage (such as SSH, AWS S3, or a local directory). This way, you can keep your large datasets or intermediate files under version control without bloating your Git repository.

By using GitHub (or any other Git platform) in combination with DVC:
1. **Git** tracks your code, metadata files, and configuration.
2. **DVC** manages your large data files and shares them via a remote storage.

Below is a step-by-step guide to set up a project with Git + DVC, organize your files, and sync your code and data across multiple machines.

---

**1. Initial Setup**  
1. **Install Required Tools:** 
Ensure you have installed: 
  - **Git** : [Download Git](https://git-scm.com/)
 
  - **DVC** : [Install DVC](https://dvc.org/)
 
 ***Note***: On ODU-Wahab load DVC with `module load dvc` and prior to any DVC command use `crun.dvc <command>`
 
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

**2. Organize Your Directory** 
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

**3. Configure DVC for `data/` and `intermediate_files/`**  
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

**4. Set Up DVC Remote for Data Storage** 
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

**5. Configure `.gitignore`** 
Add the following lines to `.gitignore` to exclude DVC-tracked files from Git:

```kotlin
data/
intermediate_files/
```
DVC automatically updates `.gitignore` when you `dvc add` files or folders.

---

**6. Commit Code and Non-DVC Files** Add and commit all remaining files (e.g., `src/`, `output/`, and other project files) to Git:

```bash
git add src/ output/ README.md
git commit -m "Add project code and outputs"
```


---

**7. Push to GitHub**  
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


---

**8. Sync Across Machines**  
1. **Clone the GitHub Repository:** 
On another machine:

```bash
git clone https://github.com/<username>/<project-repo>.git
cd project-repo
```
 
 1.5 **Change User**
 If you are not the user who originally set-up the remote storage you will need to change the userID which uses SSH to download the files. You need to have proper access to the remote storage location to use
 
 ```
 dvc remote modify myremote user their_username
 ```
 
2. **Pull Data with DVC:** 

```bash
dvc pull
```
This will download the `data/` and `intermediate_files/` folders from the DVC remote.

***Note***
To pull ODU-Wahab hosted files you must do this to only require a single password entry
```
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
dvc pull
```

---

**9. Workflow for Changes**  
1. **Add New Data:**  
  - Save new files in `data/` or `intermediate_files/`.
 
  - Track them with:

```bash
dvc add data/ intermediate_files/
```
 
2. **Push Changes:**  
  - Commit code or metadata to Git:

```bash
git add .
git commit -m "Update code and data"
git push
```
 
  - Push data to the DVC remote:

```bash
dvc push
```
 
3. **Sync Changes on Another Machine:**  
  - Pull Git updates:

```bash
git pull
```
 
  - Pull data updates:

```bash
dvc pull
```
