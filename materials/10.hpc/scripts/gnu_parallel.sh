#!/bin/bash

# this script will run the 5mc_analysis.py script in parallel using GNU parallel

conda activate parallel_and_hpc_compute_env

sequences_path="../data/sequences_to_analyze.txt"
output_file_name="../results/5mc_parallel.csv"
# remove the output file if it already exists
if [ -f "$output_file_name" ]; then
    rm "$output_file_name"
fi

# read in the sequences
readarray -t sequences < $sequences_path

# get the start time
start_time=$(date +%s)

# use gnu parallel to run the 5mc_analysis.py script in parallel
parallel -j 10 python 5mc_analysis.py --sequence {} --output_file_name "$output_file_name" ::: "${sequences[@]}"

# get the end time
end_time=$(date +%s)
echo "Parallel run time: $((end_time - start_time)) seconds"
