#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=amilan
#SBATCH --qos=normal
#SBATCH --account=amc-general
#SBATCH --time=00:05:00
#SBATCH --output=lecture10_output_%j.out
#SBATCH --array=0-0

module load anaconda

conda activate lecture10_env

sequences_path="../data/sequences_to_analyze.txt"
output_file_name="../results/cpg_islands_HPC.csv"

# read in the sequences
readarray -t sequences < $sequences_path

# set the number of sequences to analyze
num_sequences=${#sequences[@]}
SLURM_ID=$SLURM_ARRAY_TASK_ID
# get start time
start_time=$(date +%s)
python analyze_sequences.py --sequence "${sequences[$SLURM_ID]}" --output_file_name "$output_file_name"
end_time=$(date +%s)
echo "HPC parallel run time: $((end_time - start_time)) seconds"
conda deactivate

# combine the output files
cat ../results/cpg_islands_HPC*.csv > ../results/combined_cpg_islands_HPC_combined.csv
# remove the individual output files
rm ../results/cpg_islands_HPC*.csv

# combine the stdout files
cat lecture10_output_*.out > lecture10_combined_output.out
# remove the individual stdout files
rm lecture10_output_*.out
