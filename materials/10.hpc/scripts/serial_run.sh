#!/bin/bash

conda activate parallel_and_hpc_compute_env

# profile the serial run
sequences_path="../data/sequences_to_analyze.txt"
output_file_name="../results/5mc_serial.csv"
# remove the output file if it exists
if [ -f "$output_file_name" ]; then
    rm $output_file_name
fi

# read in the sequences
# if bash version is 4.0 or higher, use readarray
# uncomment line below and comment while loop
# readarray -t sequences < $sequences_path

# if bash version is lower than 4.0, use while loop
sequences=()
while IFS= read -r line
do
    sequences+=("$line")
done < $sequences_path

echo "Number of sequences to analyze: ${#sequences[@]}"

# start time profiling
start_time=$(date +%s)
for sequence in "${sequences[@]}"
do
    echo sequence: $sequence
    python 5mc_analysis.py --sequence "$sequence" --output_file_name "$output_file_name"
done

end_time=$(date +%s)
echo "Serial run time: $((end_time - start_time)) seconds"

conda deactivate
