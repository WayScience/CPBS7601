#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=amilan
#SBATCH --qos=normal
#SBATCH --account=amc-general
#SBATCH --time=00:05:00
#SBATCH --output=lecture10_output_%j.out
#SBATCH --array=0-1

module load anaconda

conda activate lecture10_env

sequences_path="../data/sequences_to_analyze.txt"

# read in the sequences
readarray -t sequences < $sequences_path

# set the number of sequences to analyze
num_sequences=${#sequences[@]}
SLURM_ID=$SLURM_ARRAY_TASK_ID

# get start time
start_time=$(date +%s)
srun python analyze_sequences.py --sequence "${sequences[SLURM_ID]}"
end_time=$(date +%s)
echo "HPC parallel run time: $((end_time - start_time)) seconds"
conda deactivate
