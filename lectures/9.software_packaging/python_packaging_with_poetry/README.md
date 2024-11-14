# Python Packaging Tutorial: Using Poetry

This tutorial provides an introduction to Python packaging using Poetry, a tool that simplifies dependency management and packaging.
Poetry allows you to declare, manage, and install project dependencies easily while also handling the build and publication of your packages.

## Overview of Poetry

Poetry is a powerful dependency management and packaging tool for Python projects.
It automates the process of dependency resolution and package management, making it easier to maintain consistent environments and share your project with others.
Unlike traditional tools like pip and setuptools, Poetry handles everything from creating pyproject.toml files to publishing packages to the Python Package Index (PyPI).

### Key features:

- Dependency management: Poetry resolves and installs all dependencies automatically, ensuring compatibility.
- Project isolation: Uses a virtual environment to isolate project dependencies from system-level Python installations.
- Easy publishing: With a single command, you can publish your project to PyPI or other package registries.

## Installation Instructions

The recommended way to install Poetry is by using pipx, which allows you to run Python applications in isolated environments.

Note: The most accurate installation instructions can be found on the Poetry documentation: https://python-poetry.org/docs/.
Below, we'll provide a brief overview of the installation process.

### Step 1: Install pipx

```bash

python3 -m pip install --user pipx
python3 -m pipx ensurepath
```

### Step 2: Once pipx is installed, use it to install Poetry:

```bash
pipx install poetry
```

Verify that Poetry is installed correctly by checking its version:

```bash
poetry --version
```

For more detailed installation options (such as installing on Windows or using alternative methods), visit the official installation guide.

## Getting Started

Once Poetry is installed, follow these steps to get started with creating and managing your Python package.

### Step 1: Initialize a new project:

### Starting from scratch

**Note: The instructions assume that you are in the `9.software_packaging/python_packaging_with_poetry` directory.**

```bash
# using poetry, run
poetry new cpbs7601  # Or whatever name you want to give your project
```

### Starting from an existing project

Navigate to your desired project directory (which could be any subfolder within a GitHub repository) and initialize it as a Poetry project.
Often, if you are developing a software tool, you will initiatilize this in the top directory.

Note: You can initialize a Poetry package in any subdirectory of a GitHub repository, not necessarily at the root of the repository.
This allows you to manage packages at the folder level rather than for the entire repo.

```bash
cd path/to/your/folder  # Often the top level directory of a GitHub repo
poetry init
```

### Step 2: Create pyproject.toml

If you used `poetry init` in an existing repository, follow the prompts to define project metadata and dependencies.

If you used `poetry new` to create a new project, Poetry will create a pyproject.toml file for you.

### Step 3: Add dependencies

You can add dependencies to your project by using the add command.
For example, to add a dependency like requests, run:

```bash
poetry add requests
```

This will install the dependency and update your pyproject.toml file.

## Other details

### Installing dependencies:

To install all the dependencies defined in your pyproject.toml, run:

```bash
poetry install
```

Poetry will create a virtual environment for your project and install the specified packages.

### Running your project:

You can execute your project or scripts within the Poetry-managed environment.
To run a Python script, use poetry to runthe command:

```bash
poetry run python your_script.py
```

### Building and publishing your package:

Once your project is ready, you can build your package by running:

```bash
poetry build
```

This will create distribution archives in the dist/ folder.
If you want to publish your package to PyPI, simply run:

```bash
poetry publish
```

By following these steps, you'll have a fully functional Python package, managed and published using Poetry.
For further guidance on advanced usage, refer to the official Poetry documentation.
