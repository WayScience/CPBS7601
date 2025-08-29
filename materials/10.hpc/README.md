# Lecture 10: High performance computing and parallel computing

This lecture will cover parallel computing and high performance computing.
We have the following learning objectives:

1. Familiarize with the concept of parallel computing
1. Understand how to leverage parallel computing
1. Learn about high performance computing
1. Understand how to leverage high performance computing
1. Learn how to use HPC resources and best practices

We will be using some pre-written scripts to explore parallel computing and high performance computing.
The following scripts are available in the [scripts](./scripts) directory:

- [analyze_sequences](scripts/analyze_sequences.py)
  - This script  contains the core sequence analysis function that we use to analyze sequences.
    Note this script is can be run for a single sequence and in a serial fashion but we will also call to be parallelized.
- [multiprocessing_run](scripts/multiprocessing_run.sh)
  - This script runs itself in parallel using the `multiprocessing` module in Python.
    This shell script calls the `multiprocessing_sequence_analysis.py` script below
- [multiprocessing_sequence_analysis](scripts/multiprocessing_sequence_analysis.py)
  - The script is called by the `multiprocessing_run.sh` script.
- [plot_parallel_compute_analysis](scripts/plot_parallel_compute_analysis.py)
  - This script plots the results of the parallel computing analysis.
- [serial_run](scripts/serial_run.sh)
  - This script runs the `analyze_sequences.py` script in serial.
- [submit_jobs_HPC](scripts/submit_jobs_HPC.sh)
  - This script submits jobs to the HPC cluster in an array job.
