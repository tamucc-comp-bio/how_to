# Installing WSL2 (Windows Subsystem Linux) Ubuntu 

This is only for those who have Windows computers, not Mac or Linux.

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

---

If that didn't work, then try following the instructions here:

1. [Install Ubuntu on Windows with WSL2](https://learn.microsoft.com/en-us/windows/wsl/install)

2. This link used to be required, but is no longer.  If you want to add a [GUI](https://en.wikipedia.org/wiki/Graphical_user_interface) app to Ubuntu, then you should be able to follow the installation instructions for that software.  Many genetic software packages are much more usable when run from Ubuntu than windows, e.g. [IGV](https://igv.org/doc/desktop/). If you want to try to install a GUI app in Ubuntu for the fun of it, then skip down to that section in this tutorial: [Add GUI App Support](https://learn.microsoft.com/en-us/windows/wsl/tutorials/gui-apps)

--- 

If that didn't work and you have an older version of Windows then try following the instructions here:

1. [Manual installation steps for older versions of WSL](https://learn.microsoft.com/en-us/windows/wsl/install-manual)
