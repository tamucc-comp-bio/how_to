# How to Set Up Your Computer for Computational Biology

Identify the operating system (OS) of your computer: Windows, Mac, or Linux. Then, follow each of the tasks below for your OS.  

_Neither ChromeOS, iOS, nor Android are  supported by [R Studio](https://en.wikipedia.org/wiki/RStudio), therefore it is going to be best for you to use a remote server like the TAMU Launch HPC which allows you to run RStudio in a webpage._ 

---

## Windows Only

For those with Windows OS, install a [linux](https://en.wikipedia.org/wiki/Linux) "virtual machine" ([Ubuntu](https://ubuntu.com/desktop/wsl)) using [Windows Subsystem Linux](https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux).  This allows you run a Linux environment within Windows, just like it was an app.

* [Install `Ubuntu` on Windows](install_wsl_ubuntu.md)

* [Install `Windows Terminal` from the microsoft store on WindowsOS](https://learn.microsoft.com/en-us/windows/terminal/install).

---

## Mac Only

* [Install `Homebrew` on MacOS](https://brew.sh/)

---

## Win and Mac and Linux

* [Install a text editor designed for coding](install_text_editor.md) 

* [Create GitHub Account](howto_github_acct.md)

* [Set up SSH Keys For Easy Access to Remote Servers & GitHub](howto_sshkeys.md)

* [Install R](install_r.md)

* [Install RStudio](install_rstudio.md)

* [Install Conda](install_conda.md)

---

## Optional

If you are working with one or more files that are >100 MB each, then GitLFS adds the capability to handle these large files.

* [Install DVC for managing large files with git on our own servers](howto_dvc.md)
* [Install Git Large File Storage Extension](install_git_lfs.md)

---

### [Return to how_to/README.md](https://github.com/tamucc-comp-bio/how_to/blob/main/README.md)
