# Installing WSL2 (Windows Subsystem Linux) Ubuntu 

This is only for those who have Windows computers, not Mac or Linux. 

The terminal scripting language native to Windows was not adopted by biologists because it is not open source and you need a Windows license to install it on a computer.  While you have paid for the Windows license on your laptop, it is prohibitively costly to run a high performance computing system on Windows because it would require dozens to thousands of license$. Consequently, [The Human Genome Project](https://www.genome.gov/human-genome-project) selected the opensource version of Unix, [Linux](https://en.wikipedia.org/wiki/Linux), which was released to the public in the first 2 years of the project, was capable of handling massive amounts of data, and was free.  Most software for the Human Genome Project was made for Linux, and that tradition continues through to today.   For these reasons, decades after the release of Linux and completion of the Human Genome Project, Linux is still the most popular OS for both supercomputers and processing biological data.  Linux is so popular, that Microsoft added native support for it in Windows - Windows Subsystem Linux (WSL). 

---

You can install everything you need to run Windows Subsystem for Linux (WSL) by completing steps 1-3.

## Step 1. Open Administrator/Elevated PowerShell Window

1. Open the Start menu
2. type `Windows PowerShell`
3. select `Windows PowerShell`
4. select `Run as administrator`.

## Step 2. Install WSL and the Default Version of Ubuntu

1. Copy and paste this command into PowerShell and hit the `Enter` key

   ```powershell
   wsl --install
   ```

   * While this is running, check out the [About WSL](https://learn.microsoft.com/en-us/windows/wsl/about) and the [WSL FAQ](https://learn.microsoft.com/en-us/windows/wsl/faq) to learn more about WSL.

2. Follow the prompts until you are asked to enter your User Name in the Ubuntu window, then move on to the next step.

   * If you encounter errors while installing WSL Ubuntu, then consult [Troubleshooting Installation Issues](https://learn.microsoft.com/en-us/windows/wsl/troubleshooting#installation-issues)

   * If you have under 3GB of free space, then it is likely that you don't have enough space on your computer to istall Ubuntu (a fresh install takes up 1.6 GB). You should skip installing Ubuntu and use the TAMU Launch HPC which allows you to run Linux in a webpage.
  
   * If you have enough space, the troubleshooting link didn't solve your error, and you have an older version of Windows then try following the [manual installation steps for older versions of WSL](https://learn.microsoft.com/en-us/windows/wsl/install-manual)

## Step 3.  Create your User Name and Password for Ubuntu

1. You will eventually be prompted for your User Name. I suggest using your [IslandID](https://islandid.tamucc.edu/identity/self-service/tcc/forgotuserid.jsf).  _DO NOT HIT `Enter` KEY UNTIL YOU HAVE TYPED YOUR USER NAME_

   ```bash
   UserName: cbird
   ```
   
3. After entering your User Name, you will be asked to enter your password.  The screen will not respond as you type it in.  Be sure to use a password you will remember. _DO NOT HIT `Enter` KEY UNTIL YOU HAVE TYPED YOUR PASSWORD_

   ```bash
   UserName: cbird
   Password:
   ```

5. If you were successful, you should see the following in your Ubuntu terminal window:

   ```bash
   cbird@xps13plus:~
   ```

   * Here, the User Name is `cbird`, the computer name is `xps13plus`, and the present working directory is `~`.
 
6. If you were unsuccessful installing WSL Ubuntu, then consult [Troubleshooting Installation Issues](https://learn.microsoft.com/en-us/windows/wsl/troubleshooting#installation-issues)

---

Once installation is complete, if you want to add a [GUI](https://en.wikipedia.org/wiki/Graphical_user_interface) app to Ubuntu, then you should be able to follow the installation instructions for that software.  Many genetic software packages are much more usable when run from Ubuntu than windows, e.g. [IGV](https://igv.org/doc/desktop/). If you were successful in installing Ubuntu and you want to try to install a GUI app in Ubuntu for the fun of it, then skip down to that section in this tutorial: [Add GUI App Support](https://learn.microsoft.com/en-us/windows/wsl/tutorials/gui-apps)

---

If you are reading this and you've successfully installed Ubuntu, then you can exit this page.  Otherwise, try the instructions here:

1. [Install Ubuntu on Windows with WSL2](https://learn.microsoft.com/en-us/windows/wsl/install)
2. [Install Ubuntu on WSL2](https://canonical-ubuntu-wsl.readthedocs-hosted.com/en/latest/guides/install-ubuntu-wsl2/)


