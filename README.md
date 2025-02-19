# how_to: Computational Biology

This repo was created to centralize tutorials for software installation, computer set up, account creation, and organization of digitized data that is relevant to Biologists seeking to employ core Data Science principals to organize, wrangle, analyze, and present their data.

---

## [How To Set Up Your Launch HPC Account (RStudio, Python & Terminal in a Web Page)](https://hprc.tamu.edu/kb/User-Guides/Launch/Access/#no-ssh-login)

Students in Computational Biology or the lab of Dr. Chris Bird should click the link above create an ACCESS account and apply for a Launch account. There will be a waiting period between when you apply for the Launch account and it is approved for you to log on.

The Launch HPC at TAMU-College Station enables you to run a Linux terminal, RStudio (R [IDE](https://en.wikipedia.org/wiki/Integrated_development_environment)), and Jupyter (Python IDE) in a webpage.

Once you are logged in for the first time, select `Clusters/>_launch Shell Access` at the top pulldown menu to open the terminal. In the terminal, run the following command to load the `nano` text editor automatically on your next login.

```bash
# Add the nano module loading to the .bashrc file
# you only need to do this one time, ever

printf '\n# Load Nano Text Editor\nmodule load GCCcore/12.3.0\nmodule load nano/8.0\n' >> ~/.bashrc

# After running the previous line, close the terminal and reopen it
```


---

## [How To Set Up Your Computer for Computational Biology](howto_setup_computer.md)

Students in Computational Biology, a workshop, or the lab of Dr. Chris Bird should click the link above to set up Win, Mac, or Linux computers. 

_Neither ChromeOS, iOS, nor Android are supported by R Studio, therefore it is going to be best for you to use a remote server like the [TAMU Launch HPC](https://hprc.tamu.edu/kb/User-Guides/Launch/Access/#no-ssh-login) which allows you to run both a Linux terminal and RStudio in a webpage._

---

## [How To Organize Biological Data](howto_organize_data.md)

This is a quick orientation to modern principals of data organization for biologists.  

---

## Manage Genetic Data With [Geome DB](https://geome-db.org/)

If you are a student in the lab of Dr. Chris Bird and your research involves genetics/genomics of wild organisms, then

* Create an account
* Send a Slack message to Dr. Bird with the email address you used to create the account and ask to be added to the appropriate project

---

## Additional Resources

* [Git & GitHub for Beginners](https://www.freecodecamp.org/news/git-and-github-for-beginners/)

* [CSB Guide to Downloading Software](https://computingskillsforbiologists.com/setup/)

* [Remove Large Files From Your GitHub Repo](rm_lg_files.md)
  
* [Different Kinds of Git Merges](https://lukemerrett.com/different-merge-types-in-git/)

* [The Linux Wiki](https://www.thelinuxwiki.net/index.php?title=The_Linux_Wiki)

