#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=amilan
#SBATCH --qos=normal
#SBATCH --account=amc-general
#SBATCH --time=00:00:30
#SBATCH --output=lecture10_output_%j.out
#SBATCH --array=0-9

module load anaconda

conda activate parallel_and_hpc_compute_env

sequences_path="../data/sequences_to_analyze.txt"
output_file_name="../results/5mc_HPC.csv"
# read in the sequences
readarray -t sequences < $sequences_path

# set the number of sequences to analyze
num_sequences=${#sequences[@]}
SLURM_ID=$SLURM_ARRAY_TASK_ID
# get start time
start_time=$(date +%s)
python 5mc_analysis.py --sequence "${sequences[$SLURM_ID]}" --output_file_name "$output_file_name"
end_time=$(date +%s)
echo "HPC parallel run time: $((end_time - start_time)) seconds"
conda deactivate


