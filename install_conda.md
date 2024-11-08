## Install Anaconda

[Anaconda](https://www.anaconda.com/products/individual) is a free distribution of Python and R that includes preinstalled packages.  When you run `conda`, it is almost invisible but you will use its installations of Python and R rather than those that are already on your system.  While this may seem a bit confusing at first, the point of Anaconda is to make using Python easier.  It does this by allow you to maintain several "environments", with each environment being dedicated to a particular task, and with the dependencies that are unique to that task.  If you only maintain one environment in which you install all packages, they and their dependencies will start to conflict with each other. 

<details><summary>Don't take it from me, hear what ChatGPT has to say</summary>
<p>

Anaconda is a popular distribution of Python (and R) that offers several advantages, particularly for students who are new to programming or working in data science and machine learning. Here's why students might want to learn to use Anaconda:

1. Simplified Package Management: Anaconda simplifies the process of installing, managing, and updating Python packages. It comes with a package manager called conda, which makes it easy to install both Python packages and their dependencies with a single command. This is especially beneficial for beginners who might find the management of dependencies challenging.

2. Pre-installed Packages: Anaconda comes with a large number of pre-installed packages, particularly those used in data science, machine learning, and scientific computing. This saves time and effort in setting up the environment and allows students to start working on projects more quickly.

3. Environment Management: With Anaconda, students can create isolated environments for different projects. Each environment can have its own set of packages and Python versions, which is crucial when working on multiple projects with different dependencies. This feature helps in avoiding conflicts between package versions and ensures reproducibility of projects.

4. Ease of Use for Data Science Tools: Anaconda is particularly popular in the data science community. It includes packages like NumPy, Pandas, SciPy, Matplotlib, and Jupyter, which are staples in data analysis and visualization. Learning to use these tools within the Anaconda environment can be beneficial for students interested in data science.

5. Cross-Platform: Anaconda works across Windows, macOS, and Linux. This cross-platform support is beneficial for students as they can work in consistent environments regardless of their operating system.

6. Community and Commercial Support: Anaconda has a large community and commercial support, making it a reliable choice for educational and professional purposes. The community provides numerous resources, tutorials, and forums for learners.

7. Integrated Development Environment (IDE) Support: Anaconda Navigator, a graphical user interface included in Anaconda, makes it easier to launch applications and manage conda packages, environments, and channels without using command-line commands.

8. Focus on Analytics and Computation: Since Anaconda is tailored for data science and machine learning, it helps students focus more on analytics and computation rather than the intricacies of package management and environment setup.

In summary, for students, especially those in fields like data science, biology, engineering, and statistics, learning to use Anaconda can greatly facilitate their learning process by easing the setup and management of the tools they need for their studies and research.

</p>
</details>

---

<details><summary>Universal Anaconda Setup </summary>
<p>

Goto your terminal and download the most appropriate installer from the [anaconda downloads page](https://www.anaconda.com/download#downloads). Use the command line installer.  

```bash
cd Downloads

# ubuntu command line installer
wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh

# mac with intel cpu command line installer
wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-MacOSX-x86_64.sh

# mac with apple cpu (M1, M2, ..., etc) command line installer
https://repo.anaconda.com/archive/Anaconda3-2023.09-0-MacOSX-arm64.sh
```

Visit the [Anaconda Installation Page](https://docs.anaconda.com/free/anaconda/install/index.html)

Select the correct instructions for your computer.  For those with windows, use the Ubuntu terminal and follow the Linux instructions.

Install 

</p>
</details>

<details><summary>Old Win/Ubuntu Anaconda Setup </summary>
<p>
 

  * In Win10-Ubuntu terminal, `Anaconda` installation is a bit more challenging than just simply following `Anaconda` [download instructions](http://computingskillsforbiologists.com/setup/basic-programming/).  Here is how to make it work:

```bash
sudo apt update
sudo apt upgrade
cd ~
mkdir downloads
cd downloads
wget https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh

# check data integrity
sha256sum Anaconda3-2020.07-Linux-x86_64.sh

# install
sudo bash Anaconda3-2020.07-Linux-x86_64.sh
```

Review the license agreement.  Note that the `d` key allows you to go down page by page.

If you see this message:

```bash
Anaconda3 will now be installed into this location:
/root/anaconda3

    - Press ENTER to confirm the location
    - Press CTRL-C to abort the installation
    - Or specify a different location below
```

We do not want to save to `/root/anaconda3`.  We want to save to `~/anaconda3`, but the installer does not recognize the ~. 

```bash
# if your installer is not pointed to ~/anaconda3, type the following
/home/YOURUSERNAME/anaconda3
```

When asked to initialize conda, do it. Finish the install, then when back in ubuntu, exit 

```bash
exit
```

Restart ubunutu terminal

```bash
cd ~

# make sure you have folder anaconda3
ls -d */

# set permissions
sudo chmod -R 777 anaconda3

# if it is still not on, you will see a (base) before your command prompt if it is on, then do this:
export PATH=~/anaconda3/bin:$PATH
conda init

# lastly, you can install jupiter notebook if you want, but we wont be using it
conda install jupyter
```


  * Using *Python*
  
    * open ubuntu terminal and type `python3`
	
  * Using Jupyter Notebook  (DONT USE JUPYTER NOTEBOOK FOR LECTURE)
  
    * In Win10-Ubunutu Terminal, first make sure the win10 `xming` app is running, then:
    
      ```bash
      #navigate to directory where you want to launch programming/
      jupyter notebook
      ```
      
    * If you installed anaconda in Win10, goto start menu and select `Jupyter Notebook (Anaconda3)`
	
    * In either, click `new` button in upper right corner, then `python3`
  
</p>
</details>

<details><summary>Old MacOS Anaconda Setup</summary>
<p>

[Anaconda](https://www.anaconda.com/products/individual) is a free distribution of Python and R that includes preinstalled packages.  When you run `conda`, it is almost invisible but you will use its installations of Python and R rather than those that are already on your system.  While this may seem a bit confusing at first, the point of Anaconda is to make using Python easier.

  *`Anaconda` should be installed following [instructions here](http://computingskillsforbiologists.com/setup/basic-programming/)
  
  * open terminal and type `python3`
  
  * To launch jupyter notebook (DONT USE JUPYTER NOTEBOOK FOR LECTURE)
  

</p>
</details>


<details><summary>Old Updating Anaconda Installation on MacOS/Ubuntu</summary>
<p>

Confirm that conda is running by checking for `(base)` before command prompt

```bash
(base) cbird@XPS15:~$
```

To update to latest version:

```bash
# this will take a while
conda update --all
```

To update to a specific version ([see list of versions](https://repo.anaconda.com/archive/)): 

```bash
# this will take a while
conda install anaconda=VERSIONNAME
```

You can also consult the [official documentation](https://docs.anaconda.com/anaconda/install/update-version/)

And also see [Keeping Anaconda Up To Date](https://www.anaconda.com/blog/keeping-anaconda-date)

</p>
</details>
