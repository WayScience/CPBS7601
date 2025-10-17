# Hands-on activity #3:

## Setting up and managing a conda environment

### Objective:

In this activity, you'll install Miniconda, create a conda environment, manage dependencies using an environment file, and install, activate, and explore the environment.
This will help you manage reproducible environments for your computational work.

### Instructions:

1. Install Miniconda

   - Follow the installation instructions [here](https://www.anaconda.com/docs/getting-started/miniconda/) for your operating system (Windows, macOS, or Linux).
   - We highly recommend a terminal-based (command prompt) install (using either wget or curl).
   - Verify installation:
     - Open a terminal and run conda --version

1. Create a conda environment file

   - Write a YAML file. YAML is a human-readable data serialization language that is often used for writing configuration files. It stands for “yet another markup language”.
   - Create a new file called `environment.yml`. Include at least:
     - Name your file with a descriptive name
     - A version of Python.
     - An additional package (e.g., numpy, pandas, or another relevant package).
     - See example below

```
name: a_descriptive_name
channels:
- conda-forge
- defaults
dependencies:
 - python=3.11
 - jupyter=1.0
 - pandas=2.0
```

3. Install and activate the environment
   - Use conda to create the environment from the `environment.yml` file:

```bash
# Create the environment
conda env create -f environment.yml

# Activate the conda environment (you will activate the name you provide)
conda activate a_descriptive_name
```

4. Verify the environment
   - Use the following command to list all installed packages in the environment:

```bash
# Verify creation and activation
conda list
```

5. Modify the environment in real time. This is super common in active development
   - [Good] Add a new package
     - To add a new package, run `conda install matplotlib` for example
     - [Note] It is not recommended to mix environment managers (e.g., pip and conda)
   - [Better] Add this package to the environment list and run `conda env update --file environment.yml`

```
# For example, add matplotlib
name: a_descriptive_name
channels:
- conda-forge
- defaults
dependencies:
 - python=3.11
 - jupyter=1.0
 - pandas=2.0
 - matplotlib
```

6. Create the cpbs7601 conda environment
   - Navigate to the course GitHub repository, in the lecture 3 folder
   - In this folder, you will see a file called `cpbs7601_environment.yml`
     - What are the contents of this file?
   - Use the skills you developed in the previous five steps to create and activate this environment
   - This will be particularly important for the next lecture on data wrangling

### Deliverables:

- Create the cpbs701 conda environment

### Resources:

- [Miniconda Installation Guide](https://www.anaconda.com/docs/getting-started/miniconda/install)
- [Conda Documentation](https://docs.conda.io/en/latest/)
- [Managing Conda Environments](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)
- [Mamba](https://github.com/mamba-org/mamba)
