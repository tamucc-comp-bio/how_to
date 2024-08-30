# ssh keys - No more passwords for remote servers and github

If you are here, you're probably wanting to set up an ssh key which allows your laptop to connect to a remote server, like one of our [high performance computing systems, aka supercomptuers](https://hpc.tamucc.edu/) or [GitHub](https://github.com). Follow these steps to get it setup

Note: you have to complete these steps for each computer that you are operating and using to connect to GitHub and other remote servers; e.g., your laptop AND your HPC/Supercomputing account.

## Step 1. Determine if you've already created a key
    
Run the following commands in your terminal

   ```bash
   cd ~
   ls .ssh
   ```
    
If you see the following files (or something very similar), you have a key. Goto step 3.

   ```
   id_rsa  id_rsa.pub
   ```
    
If you don't see a key pair `id_???` and `id_???.pub`, then goto step 2
 
## Step 2. Create a key pair
    
1. You only need 1 key pair, so if you *don't* have files named `id_???` and `id_???.pub` in your `~/.ssh` dir, then you need to generate them as follows:
    
   ```bash
   ssh-keygen -t rsa
   # you will be prompted for a pass phrase, etc
   # i recommend not entering a pass phrase and hitting the `Enter/Return` key at each prompt
   ```
    
   When the key pair is created, you should see something like this:
    
   ```
    Generating public/private rsa key pair.
    Enter file in which to save the key (/var/services/homes/Chris/.ssh/id_rsa): 
    Enter passphrase (empty for no passphrase): 
    Enter same passphrase again: 
    Your identification has been saved in /var/services/homes/Chris/.ssh/id_rsa.
    Your public key has been saved in /var/services/homes/Chris/.ssh/id_rsa.pub.
    The key fingerprint is:
    SHA256:rp5Z3rd6FenG7CZXjsERVhG5BODd4b3ReNcpr5/veq4 Chris@HOBIcloud
    The key's randomart image is:
    +---[RSA 2048]----+
    |           ....==|
    |          . . =+*|
    |           . +oBB|
    |              *o+|
    |        S    = = |
    |       .      X .|
    |        o    = = |
    |       * .  + * +|
    |     .= . o+.=EO=|
    +----[SHA256]-----+

   ```
    
2. Run the following commands in your terminal
    
   ```bash
    cd ~
    ls .ssh
    ```
    
   If you see the following files printed to the screen (or something very similar), you have a key. Goto step 3.

   ```
   id_rsa  id_rsa.pub
   ```

## Step 3.  Placing your public key on remote servers
    
* For [GitHub](https://github.com) consult the instructions [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account#adding-a-new-ssh-key-to-your-account) (Required)
    
* For any remote server/computer, copy your public to your `~/.ssh` dir on the remote computer as follows (Optional: if you don't have a [TAMUCC Crest HPC](https://www.tamucc.edu/engineering/departments/computer-science/high-performance-computing/index.php) account or a remote server then don't do this now):
    
   ```bash
   # you must be on/in your laptop (or local machine) not the remote server when you run this command
    
   ssh-copy-id YourUserName@IP-address-of-remote
    
   # you will be prompted for your password on the remote computer
   ```
        
   Example: for me (`cbird`) on the new TAMUCC Crest HPC (`crest_login.tamucc.edu`)
        
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

### [Return to How to Setup Your Computer for Computational Biology](https://github.com/tamucc-comp-bio/how_to/blob/main/howto_setup_computer.md)
