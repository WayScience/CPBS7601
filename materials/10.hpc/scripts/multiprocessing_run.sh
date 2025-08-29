#!/bin/bash

conda activate parallel_and_hpc_compute_env

# profile the serial run
sequences_path="../data/sequences_to_analyze.txt"
output_file_name="../results/5mc_multiprocessing.csv"
# remove the output file if it exists
if [ -f "$output_file_name" ]; then
    rm $output_file_name
fi

python multiprocessing_sequence_analysis.py

conda deactivate
