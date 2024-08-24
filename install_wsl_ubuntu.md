# Installing WSL2 (Windows Subsystem Linux) Ubuntu 

This is only for those who have Windows computers, not Mac or Linux. 

The terminal scripting language native to Windows was not adopted by biologists because it is not open source and you need a Windows license to install it on a computer.  While you have paid for the Windows license on your laptop, it is prohibitively costly to run a high performance computing system on Windows because it would require dozens to thousands of license$. Consequently, [The Human Genome Project](https://www.genome.gov/human-genome-project) selected the opensource version of Unix, [Linux](https://en.wikipedia.org/wiki/Linux), which was released to the public in the first 2 years of the project, was capable of handling massive amounts of data, and was free.  Most software for the Human Genome Project was made for Linux, and that tradition continues through to today.   For these reasons, decades after the release of Linux and completion of the Human Genome Project, Linux is still the most popular OS for both supercomputers and processing biological data.  Linux is so popular, that Microsoft added native support for it in Windows - Windows Subsystem Linux (WSL). 

---

You can now install everything you need to run Windows Subsystem for Linux (WSL) by entering this command in an administrator PowerShell or Windows Command Prompt and then restarting your machine.

1. Open the Start menu
2. type `Windows PowerShell`
3. select `Windows PowerShell`
4. select `Run as administrator`.
5. type the following into the PowerShell terminal:

```powershell
wsl --install
```

6. You will eventually be prompted for your User Name. I suggest using your [IslandID](https://islandid.tamucc.edu/identity/self-service/tcc/forgotuserid.jsf).  _DO NOT HIT `Enter` KEY UNTIL YOU HAVE TYPED YOUR USER NAME_
7. After entering your User Name, you will be asked to enter your password.  The screen will not respond as you type it in.  Be sure to use a password you will remember. _DO NOT HIT `Enter` KEY UNTIL YOU HAVE TYPED YOUR PASSWORD_


While this is running, check out the [About WSL](https://learn.microsoft.com/en-us/windows/wsl/about) and the [WSL FAQ](https://learn.microsoft.com/en-us/windows/wsl/faq) to learn more about WSL.

If you want to add a [GUI](https://en.wikipedia.org/wiki/Graphical_user_interface) app to Ubuntu, then you should be able to follow the installation instructions for that software.  Many genetic software packages are much more usable when run from Ubuntu than windows, e.g. [IGV](https://igv.org/doc/desktop/). If you were successful in installing Ubuntu and you want to try to install a GUI app in Ubuntu for the fun of it, then skip down to that section in this tutorial: [Add GUI App Support](https://learn.microsoft.com/en-us/windows/wsl/tutorials/gui-apps)

---

If you were unsuccessful installing, then consult [Troubleshooting Installation Issues](https://learn.microsoft.com/en-us/windows/wsl/troubleshooting#installation-issues)

1. If you have a 128GB SSD, then there is a possibility that you don't have enough space on your computer. If you don't have enough space on your computer then you should skip installing Ubuntu and use the TAMU Launch HPC which allows you to run Linux in a webpage.

--- 

If that didn't work and you have an older version of Windows then try following the instructions here:

1. [Manual installation steps for older versions of WSL](https://learn.microsoft.com/en-us/windows/wsl/install-manual)

---

If you are reading this and you've successfully installed Ubuntu, then you can exit this page.  Otherwise, try the instructions here:

1. [Install Ubuntu on Windows with WSL2](https://learn.microsoft.com/en-us/windows/wsl/install)


