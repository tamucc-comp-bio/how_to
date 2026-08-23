# Install `Miniforge` (`conda` + `mamba`)

[Miniforge](https://github.com/conda-forge/miniforge) provides the software-management tools `conda` and `mamba`, which we will use to install Python and other scientific software in isolated **environments**.

---

## Before You Install Anything: What Are We Doing?

If you are just learning how to use the command line interface, words like *package*, *environment*, `conda`, and `mamba` may be completely new to you. That is okay.

<details><summary>Python</summary>
<p>

**Python** is a programming language. A basic Python installation contains the language itself and a collection of built-in tools.

Biologists often need additional software that is not included with basic Python. For example, you may eventually want software for:

- manipulating tables
- plotting data
- working with DNA sequences
- analyzing genomic data
- reading specialized biological file formats
- running bioinformatics programs

These additional pieces of software are often installed as **packages**.

---

</p>
</details>

<details><summary>Packages</summary>
<p>

A **package** is software that adds capabilities to your computing environment.

For example, common Python packages include:

- `numpy` — numerical computing
- `pandas` — working with tables and data
- `matplotlib` — plotting
- `biopython` — tools for biological sequence data

Bioinformatics programs that are not themselves Python packages can also often be installed with Conda.

Packages frequently depend on other packages. These required packages are called **dependencies**.

For example, installing one program might require particular versions of five or ten other pieces of software.

---

</p>
</details>

<details><summary>Why This Becomes a Problem</summary>
<p>

Different research projects may require different versions of the same software.

Imagine:

- Project A requires `software_x` version 1
- Project B requires `software_x` version 2
- another program only works with an older version of Python
- a newer program requires a newer version of Python

If everything is installed into one giant software collection, programs can begin to conflict with one another.

This is one of the most common sources of frustration in scientific computing.

</p>
</details>

<details><summary>Environments</summary>
<p>

An **environment** is a self-contained software workspace.

Each environment can contain its own:

- version of Python
- packages
- bioinformatics programs
- dependencies

For example:

```text
computer
│
├── environment: population_genetics
│   ├── Python 3.13
│   ├── numpy
│   ├── bcftools
│   └── vcftools
│
├── environment: metabarcoding
│   ├── Python 3.12
│   ├── cutadapt
│   └── other packages
│
└── environment: image_analysis
    ├── Python 3.13
    ├── numpy
    └── scikit-image
```

The software in one environment generally does not interfere with software in another environment.

For scientific work, this is extremely useful because different research projects often require different software.

---

</p>
</details>

<details><summary>What Are Conda, Mamba, Conda-Forge, and Miniforge?</summary>
<p>

These names are related but they are not the same thing.

### `conda`

`conda` is an **environment manager** and **package manager**.

We can use it to:

1. create an environment
2. install software into that environment
3. activate the environment
4. remove software or environments
5. record which software was used for a research project

For example:

```bash
conda create -n fish_project python=3.13
```

creates an environment named `fish_project` containing Python 3.13.

### `mamba`

`mamba` performs many of the same tasks as `conda` and uses nearly the same commands.

For example:

```bash
conda install numpy
```

and

```bash
mamba install numpy
```

perform the same general task.

We will primarily use the word **Conda environment** because that terminology is extremely common in scientific and bioinformatics documentation. You may see either `conda` or `mamba` commands in tutorials.

### Conda-Forge

Software has to come from somewhere.

A Conda **channel** is an online collection of packages.

**conda-forge** is a large, community-maintained collection of scientific and general-purpose software packages.

Later in computational biology you will also encounter **Bioconda**, which distributes thousands of bioinformatics packages.

### Miniforge

**Miniforge** is the installer we will use.

It gives us:

- `conda`
- `mamba`
- access to the `conda-forge` package collection
- a minimal Python installation needed to run these tools

Miniforge is much smaller than the full Anaconda distribution and gives us the tools we need without installing hundreds of packages that we may never use.

---

</p>
</details>

---

## Installation of Miniforge

<details><summary>Windows Students: Use WSL Ubuntu</summary>
<p>

> [!IMPORTANT]
> If you have Windows, **install Miniforge inside your WSL Ubuntu environment**, not directly in Windows.

Open **Ubuntu** in Windows Terminal.

Your prompt should look something like:

```text
cbird@computer:~$
```

Do **not** perform the following installation from PowerShell or Command Prompt.

If you do not yet have WSL Ubuntu installed, return to the [computer setup instructions](howto_setup_computer.md) and complete the Windows/WSL setup first.

Windows students should then follow the **Linux / WSL** instructions below.

---

</p>
</details>

<details><summary>Linux / Windows WSL Installation</summary>
<p>

### Step 1. Open Your Linux Terminal

Windows students should open **Ubuntu in Windows Terminal**.

Linux students should open their normal terminal.

Move to your home directory:

```bash
cd ~
```

Confirm your location:

```bash
pwd
```

Your home directory will normally look something like:

```text
/home/yourusername
```

> [!IMPORTANT]
> Windows/WSL students should install Miniforge in the Linux home directory, **not** somewhere under `/mnt/c/`.

---

### Step 2. Make Sure `curl` Is Available

Run:

```bash
curl --version
```

If the command is not found, install it:

```bash
sudo apt update
sudo apt install curl
```

---

### Step 3. Download the Current Miniforge Installer

Run:

```bash
cd ~

curl -L -o Miniforge3.sh \
"https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-$(uname -m).sh"
```

The command automatically determines whether your Linux computer uses an `x86_64` or `aarch64` processor and downloads the current installer.

Confirm that the installer exists:

```bash
ls -lh Miniforge3.sh
```

---

### Step 4. Run the Installer

Run:

```bash
bash Miniforge3.sh
```

The installer will ask you several questions.

1. Press `Enter` to continue through the license information.
2. Type:

   ```text
   yes
   ```

   when asked whether you accept the license.

3. Accept the default installation location unless your instructor tells you otherwise. It will normally be:

   ```text
   /home/YOURUSERNAME/miniforge3
   ```

4. Near the end, the installer will ask whether it should initialize Conda.

   Answer:

   ```text
   yes
   ```

When installation finishes, **close the terminal completely and open a new terminal**.

---

</p>
</details>

<details><summary>macOS Installation</summary>
<p>

### Step 1. Open Terminal

Open the macOS **Terminal** application.

Move to your home directory:

```bash
cd ~
```

---

### Step 2. Check Your Processor Type

Run:

```bash
uname -m
```

Most newer Macs will report:

```text
arm64
```

which means the Mac has an Apple Silicon processor.

Older Intel Macs will report:

```text
x86_64
```

You do not need to choose the installer manually; the command below will use this information automatically.

---

### Step 3. Download the Current Miniforge Installer

Run:

```bash
curl -L -o Miniforge3.sh \
"https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-$(uname -m).sh"
```

Confirm that the installer exists:

```bash
ls -lh Miniforge3.sh
```

---

### Step 4. Run the Installer

Run:

```bash
bash Miniforge3.sh
```

The installer will ask you several questions.

1. Press `Enter` to continue through the license information.
2. Type:

   ```text
   yes
   ```

   when asked whether you accept the license.

3. Accept the default installation location unless your instructor tells you otherwise. It will normally be inside your home directory.

4. Near the end, the installer will ask whether it should initialize Conda.

   Answer:

   ```text
   yes
   ```

When installation finishes, **close Terminal completely and open a new Terminal window**.


---

</p>
</details>

---

## Confirm Installation Worked

<details><summary></summary>
<p>

Run:

```bash
conda --version
```

You should see output similar to:

```text
conda 26.x.x
```

The exact version number will change over time.

Now run:

```bash
mamba --version
```

You should also see a version number.

Finally, run:

```bash
conda info --base
```

You should see the location where Miniforge was installed, such as:

```text
/home/yourusername/miniforge3
```

or, on a Mac, something similar inside your home directory.

---

</p>
</details>

---

### [Return to How to Setup Your Computer for Computational Biology](https://github.com/tamucc-comp-bio/how_to/blob/main/howto_setup_computer.md)
