# CPBS7601 Lecture and Hands-On Guide

This document provides an overview of the **twelve core lectures** and the **hands-on assignments** that form the backbone of the CPBS7601 course: *Maximizing Reproducibility in Computational Biology*.

Each lecture introduces a new concept, tool, or mindset related to computational reproducibility. Each session also includes a hands-on activity or assignment designed to help you apply the material to your own research workflows.

---

## 🎓 Course Structure

Each weekly meeting lasts approximately **two hours**, divided into:

- **Lecture (≈ 1 hour):** Conceptual foundations and demonstration.
- **Hands-on session (≈ 1 hour):** Practical exercises and assignments.

This structure ensures that theoretical knowledge and practical application are tightly linked, helping you understand not only *what* reproducible practices are, but *how* to implement them effectively.

---

## 🧾 Lectures

There are **twelve lectures** in total, each lasting about one hour. All lectures are hosted in **Google Slides**, which can be viewed online without additional software. You are encouraged to make your own notes and duplicate slides for personal annotation.

[Back to Home](https://github.com/WayScience/CPBS7601)

| Lecture                                                                                                                                                | Topic                                                        | Description |
| :----------------------------------------------------------------------------------------------------------------------------------------------------- | :----------------------------------------------------------- | :----------- |
| [1. Introduction](https://docs.google.com/presentation/d/1vF0XSd1mlsBuomSQdZ_EGU5KTNy9nKUWvyctCWxroh8/edit#slide=id.p)                                  | Introduction to the course and computational reproducibility | Overview of course goals, the importance of reproducibility, and how computational reproducibility underpins credible scientific research. |
| [2. Version control](https://docs.google.com/presentation/d/1RdrZ5xog3I9a_E46GqPq2g04_JvmgzsKZGVmtrtIjlA/edit#slide=id.g2efc97b6ec8_0_339)              | Version control best practices and mindset                   | Learn how to use Git and GitHub to track code, manage history, and collaborate effectively. |
| [3. Environments](https://docs.google.com/presentation/d/1Q3K3R4ol_u0o4U93nBNJI2cLOXkx_aGgsdEfQJkGEQk/edit#slide=id.g2f1180cf2d1_0_90)                  | Computational environments                                   | Understand Python/R environments, Conda, and Poetry for reproducible software setups. |
| [4. Data wrangling](https://docs.google.com/presentation/d/1Jtty8IrwB5uGMpvD0a0caMF_WLsuWdPZVRStvU7Z11U/edit#slide=id.p)                                | Tidy data principles and software                            | Explore the “tidy data” mindset and practical tools for transforming, cleaning, and merging data. |
| [5. Workflows and orchestration](https://docs.google.com/presentation/d/1RSY-eH6Au_LtbJIQuOfYFPspQnZFwFjnhuS9rgjX1Nw/edit#slide=id.p)                   | Workflow mindset and management                              | Learn to automate multi-step analyses using Snakemake and Makefiles. |
| [6. Data visualization](https://docs.google.com/presentation/d/1vcLDZXQTOZOBxCJRP70Dmwt2PIfgPKsKE_Ek0M1evfM/edit#slide=id.p)                            | Tips, tricks, and principles for data visualization          | Discover the difference between good and bad data visualization, culminating in the Bad Graph Competition. |
| [7. Interactive data analysis](https://docs.google.com/presentation/d/1Isgawc97E8SPH2Ra07QoIOcmQQPsEnrSzZa3exd17oE/edit#slide=id.p)                     | Concepts and practical tips for interactive data analysis    | Learn about Jupyter, Shiny, and other interactive computing tools. |
| [8. Documentation and readability](https://docs.google.com/presentation/d/1DyixgDhdmu6GA_ffX7lreRRgRM_9usbKa6RAGfWwPMk/edit#slide=id.g30979671633_0_24) | Tips and tricks on how to write effective documentation      | Learn to write README files, docstrings, and comments that improve project clarity. |
| [9. R and Python Packaging](https://docs.google.com/presentation/d/1MtMec4VsRhcy65jKVXaxAgeLY4VzKXN0VnrahLdUtRA/edit#slide=id.p)                        | R and Python packaging                                       | How to structure and distribute your own reproducible code packages. |
| [10. HPC and Parallel Computing](https://docs.google.com/presentation/d/1TRMKEXlIB0ZoYuf7h60TidJwtKtB2b2j_8U_JZkY8uA/edit#slide=id.p1)                  | Hardware, parallel computing, and Alpine HPC                 | Learn about scaling analyses and running jobs on high-performance computing systems. |
| [11. Software Gardening](https://docs.google.com/presentation/d/1UIKlShdmGTQ86wRbYW3ndwcXdIaiSxr47E4dtOZt00A/edit#slide=id.g317ec89ef93_0_17)           | Mindset for sustaining code and projects                     | Explore the Software Gardening framework for long-term project health and maintainability. |
| [12. Reproducibility as an Iterative Process](https://docs.google.com/presentation/d/1_43ki2OyGj88qxt33wwDibjJXte2qfflCgsqcammKBc/edit#slide=id.p)      | Course recap and putting it all together                     | Integrate everything learned into a sustainable research workflow. |

---

## 🧪 Hands-on Materials and Assignments

The second half of each class is dedicated to applying what you’ve learned. These exercises provide an opportunity to experiment with real tools, build small but complete workflows, and reinforce best practices through doing.

[Back to Home](https://github.com/WayScience/CPBS7601)

| Hands-on                                   | Topic                                                     | Description |
| :----------------------------------------- | :-------------------------------------------------------- | :----------- |
| 1. Introduction                             | Design a simple computational biology experiment          | Brainstorm a reproducible project using a biological dataset of your choice. |
| 2. Version control                          | Setting up and using GitHub                               | Create your first repository, commit changes, and explore branches. |
| 3. Environments                             | Creating and managing a conda environment                 | Build a reproducible environment for a Python analysis project. |
| 4. Data wrangling                           | Comparing differences between R and Python t-test results | Practice data cleaning, reshaping, and statistical comparisons. |
| 5. Workflows and orchestration              | **Assignment:** Building a simple Snakemake workflow      | Design a simple data-processing pipeline using Snakemake. |
| 6. Data visualization                       | Bad graph competition                                     | Compete to make the *worst* data visualization (and learn from it). |
| 7. Interactive data analysis                | **Assignment:** Building a simple Shiny app               | Create an interactive data explorer for a chosen dataset. |
| 8. Documentation and readability            | Customize your GitHub profile with a README.md            | Write a clear and professional project README. |
| 9. R and Python Packaging                   | **Assignment:** Building a simple R package               | Package a small R function and document it for reuse. |
| 10. HPC and Parallel Computing              | No hands-on materials                                     | Focus on understanding HPC architecture and resource management. |
| 11. Software Gardening                      | Exploring Dependency Tropism                              | Reflect on project dependencies and how to maintain them sustainably. |
| 12. Reproducibility as an Iterative Process | Improving course materials by filing a pull request       | Contribute to the course by suggesting an improvement on GitHub. |

---

## 💬 Additional Tips for Students

- Always take notes directly in your GitHub repository — this helps you practice using Git in context.  
- Try to reproduce each example *after class* on your own machine to reinforce what you learned.  
- Explore alternative tools (e.g., Poetry vs Conda, R vs Python) to understand trade-offs.  
- Remember: reproducibility isn’t perfection — it’s documentation, transparency, and iteration.

---

> “Reproducibility isn’t the end of the scientific process — it’s the foundation that lets others begin.”
