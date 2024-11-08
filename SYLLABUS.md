# Syllabus

## Course information

- CPBS 7601 - Computing Skills in Biomedical Sciences
- Dates: November 4th-20th, 2024
- Meetings: 2-4pm M-F
- Location: Anschutz Health Sciences Building (AHSB) P12 4th floor Room 4002

## Instructor information

- Name: Gregory Way, PhD
- Office location: ASHB P12-6275
- Office hours: By appointment
- Contact: gregory.way "at" cuanschutz "dot" edu
- Teaching Assistants: Jade Young
- TA contact: jade.young "at" cuanschutz "dot" edu
- TA office hours: Immediately following each regular class

## Prerequisites

This course is intended for students from the Computational Biosciences, Computational Neuroscience, Human Medical Genetics and Genomics, and related programs where student research will be primarily computational.
Students are required to have proficiency in coding (2+ years in R, python or equivalent) and have taken relevant computational coursework (or equivalent per instructor’s consent).
If you are outside the programs listed above, please consult with the instructor before enrolling to assess fit.

## Requirements

Access to a computer with an internet connection and the ability to create programs.
In general, you will need access to the computational resources necessary to perform hands-on exercises.
If additional university supplied tools are necessary, please contact the instructor as soon as possible.

## GitHub repositories

All materials are available on GitHub with permissive open source licenses

| Repository                              | Purpose          |
| :-------------------------------------- | :--------------- |
| https://github.com/WayScience/CPBS7601/ | Course materials |
| https://github.com/WayScience/sandbox   | Learning GitHub  |

## Extra credit

We will not accept extra credit assignments.

## Late policies

We will accommodate reasonable requests for extension of project deadlines due to personal hardships.
Please contact Dr. Way with these requests.
Ideally, requests should be made at least two days before the deadline.

## Course objectives

To introduce the skills needed to perform reproducible and high quality computational research in biomedical sciences.

## Recommended pre-reading

- Sandve et al. `Ten Simple Rules for Reproducible Computational Research`. 2013. PLoS Computational Biology. https://doi.org/10.1371/journal.pcbi.1003285
- Hadley Wickham. `Tidy Data`. 2014. Journal of Statistical Software. https://www.jstatsoft.org/article/view/v059i10

## Course schedule

### Lecture 1: Introduction to reproducible research

- Course overview and mission statements
- What is reproducibility in computational research?
- Motivating theory and importance
- **Hands-on:** Designing a simple computational experiment

### Lecture 2: Version control

- Version control principles and practices
- Version control case studies
- Basics of Git and GitHub
- Advanced topics
- The computational biologist mindset
- **Hands-on:** Setting up a GitHub account, setting up SSH keys, forking and cloning a git repository, and making a pull request

### Lecture 3: Computational environments

- What is an integrated development environment (IDE) with examples (e.g., VSCode, RStudio)
- Jupyter notebooks theory and practice
- Understanding virtual machines and isolated environments (e.g., Conda)
- Introduction to containers (e.g., Docker)
- Managing a project with Poetry
- Continuous Integration and Continuous Deployment (CI/CD)
- **Hands-on:** Setting up and managing a conda environment

### Lecture 4: Data wrangling

- The mindset of a data scientist
- Best practices for data management and processing
- Tidy data
- Introduction to the tidyverse in R
- Introduction to pandas in python
- Data wrangling for machine learning
- **Hands-on:** Use pandas or tidyverse to visualize differences between R vs. scipy t-tests

### Lecture 5: Workflows and orchestration

- Tasks, dependencies, and DAGs
- Bash
- Tools for workflow orchestration (e.g., Snakemake, Nextflow)
- **Assignment:** Creating and running a snakemake workflow

### Lecture 6: Data visualization

- Principles of data visualization
- Using ggplot2 and other visualization tools
- Data visualization software (ggplot2, patchwork, pandas)
- Mindset and storytelling
- **Hands-on:** Bad graph competition

### Lecture 7: Developing apps for interactive data analysis

- Exploratory data analysis
- Hans Rosling’s GapMinder
- Shiny principles and practice
- **Assignment**: Building a simple Shiny app

### Lecture 8: Documentation and readability

- Importance of documentation in reproducible research
- Markdown
- Documentation in code
- Auto-documentation
- Testing frameworks
- Helpful artificial intelligence tools
- **Hands-on:** Personalize your GitHub profile with markdown

### Lecture 9: R and Python packaging

- The philosophy of packaging software
- Creating and managing python packages with poetry
- Creating and managing R packages with devtools and roxygen2
- Data packaging
- **Assignment:** Developing a simple R/Python package

### Lecture 10: High performance computing and parallel computing

- Overview of HPC, Alpine, and SLURM
- Introduction to parallel computing and multithreading
- **Hands-on:** Submitting simple jobs using SLURM

### Lecture 11: Software gardening

- General concepts for software development
- Writing clean, maintainable code
- **Hands-on:** Adding comments and improving code readability

### Lecture 12: Reproducibility as an iterative process

- Reproducibility is a north star
- Iterative nature of reproducibility
- Continuous integration and testing
- **Hands-on:** File a pull request to improve the CPBS7601 github repository

### Lecture 13: Student presentations

- See below

## Student presentations

Each student will create a short, 3-minute presentation consisting of three slides.

**Objective:** To discover and explore an open source software package that you were not familiar with before this assignment.

### Presentation requirements:

- Slide 1: Introduction to the software package
  - What does it do?
  - Provide a brief overview of the software package's functionality and purpose.
- Slide 2: Analysis and interest
  - Why is it interesting?
    - Explain what makes this software package noteworthy or unique.
  - Who is developing it?
    - Identify the developers or the organization behind the software. Provide any relevant background information.
- Slide 3: Relevance and practical experience
  - How might it be relevant for biomedical informatics?
    - Discuss potential applications or implications of this software in the field of biomedical informatics.
  - Were you able to install it?
    - Describe your experience with installing the software package.
  - Did you try their tutorial?
    - Share your experience with any tutorials provided by the developers. Mention any challenges or successes you encountered.

### Instructions:

**Research:** Find an open source software package on GitHub that you have not used before.
**Explore:** Investigate the software’s functionality, its developers, and how it might be relevant to biomedical informatics.
**Install:** Attempt to install the software on your system.
**Tutorial:** Follow any provided tutorials to get a hands-on understanding of the software.
**Create:** Develop a three-slide presentation covering the points outlined above.
**Present:** Be prepared to deliver a concise 3-minute presentation to your peers.

This project will help you gain exposure to new tools in the field, develop your ability to quickly assess software packages, and enhance your presentation skills.

### Presentation Grading:

You will be graded on completeness and adherence to guidelines (e.g., timing, content, etc.).

## Assignments

There are three assignments in this course:

- Creating and running a snakemake workflow
- Building a simple Shiny application
- Developing a single R or Python package

### Approach

We will review the assignment in detail after each relevant lecture.
The second half of the lecture will be optional.
However, we encourage folks to stick around to work on their assignment.
We will be easily accessible then to answer any questions.
The TAs will grade each assignment using the scale below.
Please follow all instructions carefully!

### Grading

All assignments will be graded on a 1-4 point scale with the following criteria:

| Point | Description              | Level                 | Criteria                                                                                                                                                                                                        |
| ----- | ------------------------ | --------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 4     | Advanced Understanding   | Exceeds expectations  | Answers every part of the question in great detail. Gives additional information, perspective, or ideas (i.e., Example from class, example from personal work experience, additional detail). Cites references. |
| 3     | Proficient Understanding | Meets expectations    | Answers the question in full without additional detail.                                                                                                                                                         |
| 2     | Partial Understanding    | Partial understanding | Understands parts of the question. Does not fully answer the question.                                                                                                                                          |
| 1     | Minimal Understanding    | Minimal understanding | It is clear there is minimal understanding of the topic. Does not answer most of the question.                                                                                                                  |

## Course policies

_Guiding Principles for Students in Use of AI and Machine Learning (ML) Tools in Education Developed collaboratively with Campus Health Sciences Faculty Committee_
We, as members of the AMC Community, strive to be innovative and curious in our approach to the use of new technology.
Especially, given our commitment to improving health and biomedical research, we are responsible to approach the use of these tools with integrity and professionalism.

1. Never enter identifiable patient data/information into third party tools.
1. If using tools to assist with clinical decision-making, ensure these are approved by the health system and based on best available evidence.
1. Familiarize yourself with the pitfalls of various tools such as bias, hallucinations, incorrect information.
1. Be vigilant about the presence of biases in work generated by AI/ML; strive to mitigate the dissemination of these biases.
1. Avoid use of AI/ML to replace successful, evidence-based study strategies given concern these tools may negatively impact learning.
1. Critically evaluate any AI/ML generated responses with knowledge from course work and other resources.
1. Be honest and transparent about the use of AI and ML tools in curricular work such as studying and assignments. Citation of use should include name of the specific tool (and version) used and how it was used (outline generation, first draft, final draft). Ex: ChatGPT, v4 was used to generate an outline for this paper.
1. Failure to cite use of outside tools may be considered plagiarism and will be addressed in the same way other academic professionalism lapses would be.
1. Do not use AI/ML tools to gain advantage over your classmates.
1. Approach new technology and tools with curiosity.

_Accommodation statement_
The University of Colorado Anschutz Medical Campus is committed to providing equitable access to our programs for students with disabilities (e.g., psychological, attentional, learning, chronic health, sensory, and physical).
To engage in a confidential conversation about the process for requesting reasonable accommodations in the classroom and clinical settings please contact The Office of Disability, Access, & Inclusion at: disabilityaccess@cuanschutz.edu or begin the process via the website.
Accommodations are not provided retroactively, therefore, students are encouraged to begin this process early.

_Religious observances_
Campus policy regarding religious observances requires that faculty make every effort to deal reasonably and fairly with all students who, because of religious obligations, have conflicts with scheduled exams, assignments or required assignments/attendance.
If this applies to you, please speak with me directly as soon as possible at the beginning of the term.

_Classroom behavior_
Students and faculty each have responsibility for maintaining an appropriate learning environment.
Those who fail to adhere to such behavioral standards may be subject to discipline.
Professional courtesy and sensitivity are especially important with respect to individuals and topics dealing with differences of race, color, culture, religion, creed, politics, veteran’s status, sexual orientation, gender, gender identity and gender expression, age, ability, and nationality.
Class rosters are provided to the instructor with the student's legal name.
I will honor your request to address you by an alternate name or gender pronoun.
Please advise me of this preference early in the semester so that I may make appropriate changes to my records.

_Discrimination and harassment_
The University of Colorado Denver (CU-Denver) is committed to maintaining a positive learning, working, and living environment.
CU-Denver will not tolerate acts of discrimination or harassment based upon Protected Classes or related retaliation against or by any employee or student.
For purposes of this CU-Denver policy, "Protected Classes" refers to race, color, national origin, sex, pregnancy, age, disability, creed, religion, sexual orientation, gender identity, gender expression, veteran status, political affiliation or political philosophy.
Individuals who believe they have been discriminated against should contact the Office of Equity at 303-315-2567 or the Office of Student Conduct and Community Standards (OSC) at 303-315-7311.
The full policy on discrimination and harassment has more information.
