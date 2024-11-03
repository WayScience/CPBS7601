#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=amilan
#SBATCH --qos=normal
#SBATCH --account=amc-general
#SBATCH --time=00:05:00
#SBATCH --output=lecture10_output_%j.out

module load anaconda

conda activate lecture10_env

sequences_path="../data/sequences_to_analyze.txt"

# read in the sequences
readarray -t sequences < $sequences_path

# set the number of sequences to analyze
num_sequences=${#sequences[@]}

command="python analyze_data.py --sequence"

sbatch --array=0-$((num_sequences-1)) -c 1 --mem=10M --time=0-00:05:00 --wrap="$command ${sequences[@]}"

conda deactivate
