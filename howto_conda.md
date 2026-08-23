# How to Use Conda (Miniforge, Mamba)

## What is the Purpose of Conda?

If you are just learning how to use the command line interface, words like *package*, *environment*, `conda`, and `mamba` may be completely new to you. That is okay. We will introduce some terminology and explain why `conda` is useful.

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

## Basics of Conda and Miniforge

<details><summary>Keeping the `base` environment clean</summary>
<p>

Miniforge itself lives in an environment named `base`.

After installation, your command prompt may begin with:

```text
(base)
```

For example:

```text
(base) cbird@computer:~$
```

The `base` environment contains the software needed to operate Conda and Mamba.

We generally **do not want to install research software into `base`**.

Instead, we will create separate environments for projects.

Configure Conda so that `base` does not automatically activate every time you open a terminal:

```bash
conda config --set auto_activate_base false
```

Close and reopen your terminal.

The `(base)` at the beginning of the prompt should now be gone.

This does **not** uninstall Conda. The `conda` and `mamba` commands should still work.

Test:

```bash
conda --version
```

---

</p>
</details>

---

## 
<details><summary>Create Your First Environment</summary>
<p>

We are going to create a temporary environment to make sure everything works.

Run:

```bash
conda create -n compbio_test python=3.13
```

Conda will show you the packages it plans to install and ask:

```text
Proceed ([y]/n)?
```

Type:

```text
y
```

and press `Enter`.

You have now created an environment named:

```text
compbio_test
```


---

</p>
</details>

<details><summary>Activate the Environment</summary>
<p>

Run:

```bash
conda activate compbio_test
```

Your terminal prompt should now begin with:

```text
(compbio_test)
```

For example:

```text
(compbio_test) cbird@computer:~$
```

This tells you that the `compbio_test` environment is currently active.

---

</p>
</details>

<details><summary>Confirm Which Python You Are Using</summary>
<p>

Run:

```bash
python --version
```

You should see Python 3.13.

Now run:

```bash
which python
```

On Linux/WSL you should see something resembling:

```text
/home/yourusername/miniforge3/envs/compbio_test/bin/python
```

The important part is:

```text
envs/compbio_test
```

That tells you that the `python` command is using the copy of Python **inside this environment**.

This is one of the main reasons environments are useful.

---

</p>
</details>

<details><summary>Install a Package</summary>
<p>

While `compbio_test` is still active, install NumPy:

```bash
conda install numpy
```

When asked whether to proceed, type:

```text
y
```

Now ask Conda to show everything installed in the environment:

```bash
conda list
```

You will see Python, NumPy, and the other packages needed for them to work.

---

</p>
</details>
<details><summary>Deactivate the Environment</summary>
<p>

Run:

```bash
conda deactivate
```

The `(compbio_test)` label should disappear from the beginning of your command prompt.

The environment still exists, but it is no longer active.

---

</p>
</details>

<details><summary>List Your Environments</summary>
<p>

At any time, you can see your Conda environments with:

```bash
conda env list
```

You should see both:

```text
base
compbio_test
```

The `*` indicates the environment that is currently active.

---

</p>
</details>

<details><summary>Remove the Test Environment</summary>
<p>

Because `compbio_test` was only a test, remove it:

```bash
conda env remove -n compbio_test
```

Confirm that it is gone:

```bash
conda env list
```

Congratulations — Miniforge, Conda, and Mamba are working.

---

</p>
</details>

<details><summary>The Basic Pattern You Will Use in Research</summary>
<p>

Most of the time, using Conda follows the same basic pattern.

## 1. Create an environment

```bash
conda create -n my_project python=3.13
```

## 2. Activate it

```bash
conda activate my_project
```

## 3. Install software

```bash
conda install numpy pandas
```

or:

```bash
mamba install numpy pandas
```

## 4. Do your work

Run Python, R, bioinformatics programs, scripts, etc.

## 5. Deactivate the environment when finished

```bash
conda deactivate
```

---

</p>
</details>

<details><summary>A Few Commands to Remember</summary>
<p>

| Task | Command |
| --- | --- |
| See Conda version | `conda --version` |
| See Mamba version | `mamba --version` |
| List environments | `conda env list` |
| Create an environment | `conda create -n NAME` |
| Create an environment with Python | `conda create -n NAME python=3.13` |
| Activate an environment | `conda activate NAME` |
| Leave an environment | `conda deactivate` |
| List installed packages | `conda list` |
| Install a package | `conda install PACKAGE` |
| Install using Mamba | `mamba install PACKAGE` |
| Remove an environment | `conda env remove -n NAME` |

You do **not** need to memorize all of these now.

---

</p>
</details>

<details><summary>Important Rules</summary>
<p>

> [!IMPORTANT]
> **Do not use `sudo conda` or `sudo mamba`.**

Miniforge should be installed in your own home directory, so administrator privileges are not needed to install packages or create environments.

> [!IMPORTANT]
> **Do not install research software into the `base` environment unless you have a specific reason to do so.**

Create a separate environment instead.

> [!TIP]
> **Use separate environments for separate research projects or workflows.**

This reduces conflicts among software and makes your analyses easier to reproduce.

> [!TIP]
> **Look at the beginning of your command prompt before running software.**

If you see:

```text
(my_project)
```

then the `my_project` environment is active.

---

</p>
</details>

<details><summary>Why This Matters for Reproducible Science</summary>
<p>

An environment does more than prevent software conflicts.

It also gives us a way to record the software used for an analysis.

For example, from inside an environment you can eventually create a file describing the important packages that you intentionally installed:

```bash
conda env export --from-history > environment.yml
```

That file can be stored with your analysis code in GitHub.

Another researcher can then create a similar environment from that file:

```bash
conda env create -f environment.yml
```

This helps document the computational methods used in a research project.

---

</p>
</details>

<details><summary>Official Miniforge Documentation</summary>
<p>

The Miniforge project and current installers are maintained by the conda-forge community:

https://github.com/conda-forge/miniforge

---

</p>
</details>
