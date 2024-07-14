# Installing R

It is critically important that you keep R up to date on your computer.  If you do not, you will start to run into compatibility issues between R and R packages, and your code will stop working, and you will spend hours trying to figure out why. So, even if you have R already, it's a good idea to make sure it's the newest version.

_Note: when you reinstall R, you generally lose all of your packages from the old version, and you will have to install them again.  While this is arduous, it does ensure a match between your packages and your R version._

<details><summary>Checking to see if you have R in Ubuntu</summary>
<p>

Note that there are differences here if you have a Mac or Windows computer.

To check if you have `R`, goto your terminal window and enter the following command:

```
$ R
```

If you see this (or similar), then R is installed and you can proceed.  You should a version at least as new as that listed below.

```
$ R

R version 4.2.1 (2022-06-23) -- "Funny-Looking Kid"
Copyright (C) 2022 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

>
```

If you see this message (or something similar) then you need to install `R`

```
Command 'R' not found, but can be installed with:
```

___
</p>
</details>

<details><summary>Install R on Ubuntu</summary>
<p>

[Official Instructions](https://cloud.r-project.org/bin/linux/ubuntu/)

1. Start by updating and upgrading your existing Ubuntu commands and apps:

```
# this may take some time to complete if you have not been running these commands regularly
sudo apt update
sudo apt upgrade
```

2. Install the dependencies needed

```
# update indices
sudo apt update -qq

# install two helper packages we need
sudo apt install --no-install-recommends software-properties-common dirmngr

# add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# Fingerprint: E298A3A825C0D65DFD57CBB651716619E084DAB9
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc

# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
```

3. Install R v4.XX.  

```
# if R was not on your system before starting this procedure then:
sudo apt install --no-install-recommends r-base
sudo apt-get install r-base-dev

# else if R was on your system, but it was an older version, such as 3.6, then
sudo apt-get install r-base-dev
sudo apt update
sudo apt upgrade
```

4. Verify that you have successfully installed R v 4.XX

```
R --version
```

If the above instructions did not work, you can consult the [full README](https://cloud.r-project.org/bin/linux/ubuntu/fullREADME.html).

---
</p>
</details>

<details><summary>Install R on Win</summary>
<p>

1. Goto the [R download page](https://cloud.r-project.org/) and select the Win Download link.

2. Select "install R for the first time"
   
3. Select "Download R-____ for Windows"
   
4. Run the file that was downloaded

If you have trouble with this, then consult the [CSB instructions](http://computingskillsforbiologists.com/setup/statistical-computing/)

---
</p>
</details>

<details><summary>Install R on Mac</summary>
<p>

1. Goto the [R download page](https://cloud.r-project.org/) and select the Mac Download link.

2. [Determine if you have an Intel or Apple cpu.](https://www.howtogeek.com/706226/how-to-check-if-your-mac-is-using-an-intel-or-apple-silicon-processor/)

3. MacOS: Select the R-X.X.X.pkg download link for your OS and computer setup
    * the choice depends on whether you have an Apple cpu, or intel.


If you have trouble with this, then consult the [CSB instructions](http://computingskillsforbiologists.com/setup/statistical-computing/)

---
</p>
</details>


<details><summary>Running R from terminal</summary>
<p>

To run `R`, just type `R` and hit your enter/return key

```
$ R

R version 3.6.3 (2020-02-29) -- "Holding the Windsock"
Copyright (C) 2020 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

>
```

That is it, you are in an `R` shell, and `bash` commands will no longer work.  Notice the command prompt is now a `>` instead of a `$` or a `%` depending on your computer.

---
</p>
</details>

<details><summary>Exiting R Shell</summary>
<p>

The keys `ctrl+d` will exit the R shell. You will be prompted to save your session.  If you say yes, all of your work will be saved and available when you open the R shell again.

Now that you see how to enter and exit the R shell, enter the R shell again.

```bash
$ R

>
```

---
</p>
</details>
