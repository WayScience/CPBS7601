# CPBS7601 - Maximizing Reproducibility in Computational Biology

Course on computing skills in bioinformatics for CU Anschutz PhD Students.

This course teaches students how to conduct computational biology research with a focus on **reproducibility**, **version control**, **data management**, and **computational literacy**. Students will learn how to move from ad hoc scripts and manual workflows to robust, shareable, and well-documented computational pipelines that stand up to scientific review and collaborative use.

---

## 🧠 What This Course Is About

In **CPBS7601**, we explore the essential tools and mindsets that enable computational biologists to create reliable, reproducible, and scalable analyses. Through lectures, demonstrations, and hands-on projects, you’ll learn how to:

- Structure computational research projects for clarity and reproducibility  
- Use **Git and GitHub** to track code, data, and collaboration  
- Manage environments using **Conda**, **Poetry**, or **uv** for portable workflows  
- Write readable, maintainable code in **Python** and **R**  
- Automate tasks and analyses using **Makefiles**, **Notebooks**, and **workflow systems**  
- Understand the principles of **data provenance** and **open science practices**  
- Evaluate and communicate results through effective visualizations  

By the end of the course, you’ll have built a reproducible, documented mini-project that reflects your own research interests.

---

## 🧭 Getting Started

Before attending your first session, make sure you have a working computational environment.

### 1. Install Git
Download and install Git:
- [Windows](https://git-scm.com/download/win)
- [macOS](https://git-scm.com/download/mac)
- [Linux](https://git-scm.com/download/linux)

Verify it’s working:
```bash
git --version
```

### 2. Install an IDE or Code Editor
We recommend **VS Code** (Visual Studio Code) as the primary editor. It’s lightweight, extensible, and supports Python, R, Git, and Markdown out of the box.

- Download from [code.visualstudio.com](https://code.visualstudio.com)
- Install these helpful extensions:
  - *Python* (Microsoft)
  - *R Tools* or *R Language Support*
  - *GitHub Pull Requests and Issues*
  - *Markdown All in One*
  - *Jupyter* (for notebooks)

Alternative IDEs:
- **PyCharm** (Python focus)
- **RStudio** (R focus)
- **JupyterLab** (notebook-centric workflows)

### 3. Install Python and Package Manager
We’ll use **Conda** or **Miniforge** for reproducible environments.

```bash
# Recommended for macOS / Linux / Windows
conda install -c conda-forge python=3.11
```

Or install **Miniforge**:
```bash
# Example (Linux/macOS)
curl -L -O https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-arm64.sh
bash Miniforge3-MacOSX-arm64.sh
```

Check your installation:
```bash
python --version
conda --version
```

### 4. Clone the Course Repository
All materials are hosted on GitHub under the [WayScience/CPBS7601](https://github.com/WayScience/CPBS7601) repository.

```bash
git clone https://github.com/WayScience/CPBS7601.git
cd CPBS7601
```

### 5. Launch an IDE
Open the cloned folder in VS Code or your chosen IDE:
```bash
code CPBS7601
```

---

## 📚 Course Components

| Component | Description |
|------------|--------------|
| **Lectures** | Conceptual foundations and demonstrations of reproducible research methods |
| **Hands-on Assignments** | Practical exercises in Python, R, Git, and workflow management |
| **Final Mini-Project** | Apply course skills to a self-contained, reproducible analysis |
| **Discussion and Reflection** | Explore ethical and social dimensions of computational reproducibility |

---

## 🔗 Useful Links

- [Lecture Slides](https://github.com/WayScience/CPBS7601/blob/main/materials/README.md)
- [Hands-on Assignments](https://github.com/WayScience/CPBS7601/blob/main/materials/#hands-on-materials-and-assignments)
- [Syllabus](https://github.com/WayScience/CPBS7601/blob/main/LICENSE.md)

---

## 🧪 “Bad Graph” Competition

Every year, we hold the **Winning Graphs (Bad Graph) Competition** — a humorous exercise in identifying what *not* to do when visualizing data. The goal: to learn how poor design choices affect interpretation.

- [2024 Winner](https://github.com/WayScience/CPBS7601/blob/main/hands_on/hall_of_infamy/ugly_plot_stacked_bar_polar.png)

---

## 🧩 What You’ll Need to Know by the End

- How to use Git and GitHub for version control  
- How to create reproducible computational environments  
- How to document code and analyses for others (and your future self)  
- How to visualize and communicate biological data effectively  
- How to critically evaluate reproducibility in published research  

---

## 💡 Next Steps

1. Clone this repository and explore the `materials/` folder.  
2. Review the [syllabus](https://github.com/WayScience/CPBS7601/blob/main/LICENSE.md).  
3. Complete the “Setup and First Commit” assignment.  
4. Introduce yourself on the course forum or discussion board.  

---

### Questions or Issues?

If you run into setup issues or have course-related questions, please open a [GitHub Issue](https://github.com/WayScience/CPBS7601/issues) with the label `help-wanted` or contact the teaching team.

---

> “Reproducibility is not a burden — it’s a superpower.”
