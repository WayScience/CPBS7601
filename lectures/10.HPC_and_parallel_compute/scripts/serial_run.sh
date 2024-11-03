#!/bin/bash

# profile the serial run
start_time=$(date +%s)

sequences_path="../data/sequences_to_analyze.txt"

# read in the sequences
readarray -t sequences < $sequences_path

for sequence in "${sequences[@]}"
do
    python analyze_data.py --sequence "$sequence"
done

end_time=$(date +%s)
echo "Serial run time: $((end_time - start_time)) seconds"
