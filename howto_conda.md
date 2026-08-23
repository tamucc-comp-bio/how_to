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
