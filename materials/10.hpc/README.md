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

- [5mc_analysis.py](scripts/5mc_analysis.py)
  - This script contains the a wrapper for the core sequence analysis function from `utils/sequence_analysis.py` that we use to analyze sequences. 
  It parses command line arguments `--sequence` and `--outputfile`, outputting a results csv to the specified outputfile. 
    Note: this script may be run for a single sequence, in a serial fashion, or in parallel.
    
- [multiprocessing_run.sh](scripts/multiprocessing_run.sh)
  - This script runs the `multiprocessing_sequence_analysis.py` script which utilizes the `count_5mc_sequences` function from `utils/sequence_analysis.py` in parallel with the `multiprocessing` Python module.
  
- [multiprocessing_sequence_analysis.py](scripts/multiprocessing_sequence_analysis.py)
  - The script is called by the `multiprocessing_run.sh` script.
  
- [plot_parallel_compute_analysis.py](scripts/plot_parallel_compute_analysis.py)
  - This script plots the results of the parallel computing analysis.
  
- [serial_run.sh](scripts/serial_run.sh)
  - This script runs the `utils/sequence_analysis.py` serially using bash.
  
- [gnu_parallel.sh](scripts/gnu_parallel.sh)
  - This script uses gnu parallel linux command to allocate sequences to different jobs running `5mc_analysis.py`.
  
- [submit_jobs_HPC.sh](scripts/submit_jobs_HPC.sh)
  - This script submits multiple slurm jobs to the HPC cluster in an array job which each run the `5mc_analysis.py` script on a different sequence.
