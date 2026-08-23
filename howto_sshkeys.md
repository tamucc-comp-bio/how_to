# ssh keys - No more passwords for remote servers and github

If you are here, you're probably wanting to set up an ssh key which allows your laptop to connect to a remote server, like one of our [high performance computing systems, aka supercomptuers](https://hpc.tamucc.edu/) or [GitHub](https://github.com). Follow these steps to get it setup

Note: you have to complete steps 1-3 for each computer that you are operating and using to connect to GitHub and other remote servers; e.g., your laptop AND your HPC/Supercomputing account AND any other computer that might use for this class/workshop.

---

## Step 1. Determine if you've already created a key
    
Run the following commands in your terminal

   ```bash
   cd ~
   ls .ssh
   ```
    
If you see the following files (or something very similar), you have a key. Goto step 3.

   ```
   id_ed25519 id_ed25519.pub
   ```

If you get an error stating that `.ssh` doesn't exist , then create the directory named `.ssh`

   ```bash
   mkdir .ssh
   ```

---

## Step 2. Create a key pair
    
1. You only need 1 key pair, so if you *don't* have files named `id_???` and `id_???.pub` in your `~/.ssh` dir, then you need to generate them as follows:
    
   ```bash
   ssh-keygen -t ed25519 -C "TYPE_YOUR_GITHUB_EMAIL_HERE"
   ```
   
   You will be prompted for a pass phrase, etc..., I recommend not entering a pass phrase and hitting the `Enter/Return` key at each prompt

   ```bash
   Enter file in which to save the key: [press Enter]
   Enter passphrase (empty for no passphrase): [press Enter]
   Enter same passphrase again: [press Enter]
   ```
    
   When the key pair is created, you should see something like this:
    
   ```bash
    Generating public/private ed25519 key pair.
    Enter file in which to save the key (/home/cbird/.ssh/id_ed25519):
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    Your identification has been saved in /home/cbird/.ssh/id_ed25519
    Your public key has been saved in /home/cbird/.ssh/id_ed25519.pub
    The key fingerprint is:
    SHA256:VB5/qhanPct0C0tlbpZTTB0lnEWGv2Zgfpcy+dcLuAs cbird808@gmail.com
    The key's randomart image is:
    +--[ED25519 256]--+
    |          o  ..**|
    |         o o  +oo|
    |        . . . ..o|
    |       .     = o.|
    |        S . = = =|
    |           *.O O.|
    |         E+.*.# o|
    |         ..+.O.+o|
    |           o= ..o|
    +----[SHA256]-----+
   ```
    
1. Run the following commands in your terminal
    
   ```bash
    cd ~
    ls .ssh
    ```
    
   If you see the following files printed to the screen (or something very similar), you have a key. Goto step 3.

   ```
   id_ed25519  id_ed25519.pub
   ```

---

## Step 3.  Placing your public key on remote servers
    
* For [GitHub](https://github.com) consult the instructions [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account#adding-a-new-ssh-key-to-your-account) (Required)
    * You can test whether you were successful in adding your public key to github by running the following code:
      
      ```bash
      ssh -T git@github.com
      ```
      
      And you should get a response like this:
      
      ```bash
      Hi cbird808! You've successfully authenticated, but GitHub does not provide shell access.
      ```
    
* For any remote server/computer, copy your public key to your `~/.ssh` dir on the remote computer as follows (Optional: if you don't have a [TAMUCC Crest HPC](https://www.tamucc.edu/engineering/departments/computer-science/high-performance-computing/index.php) account or a remote server then don't do this now):
    
   ```bash
   # you must be on/in your laptop (or local machine) not the remote server when you run this command
    
   ssh-copy-id YourUserName@IP-address-of-remote
    
   # you will be prompted for your password on the remote computer
   ```
        
   Example: for me (`cbird`) on the new TAMUCC Crest HPC (`crest-login.tamucc.edu`)
        
   ```
   cbird@3950x:~$ ssh-copy-id cbird@crest_login.tamucc.edu
   /usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
   /usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
   (cbird@crest_login.tamucc.edu) Password: 

   Number of key(s) added: 1

   Now try logging into the machine, with:   "ssh 'cbird@crest_login.tamucc.edu'"
   and check to make sure that only the key(s) you wanted were added.

   ```

---

## Step 4.  Goto Step 1

You have to complete steps 1-3 for each computer that you are operating and using to connect to GitHub and other remote servers; e.g., your laptop AND your HPC/Supercomputing account AND any other computer that might use for this class/workshop.


---

### [Return to How to Setup Your Computer for Computational Biology](https://github.com/tamucc-comp-bio/how_to/blob/main/howto_setup_computer.md)
