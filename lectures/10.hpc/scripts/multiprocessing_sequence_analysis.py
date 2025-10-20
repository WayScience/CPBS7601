import multiprocessing
import pathlib
import sys
import time

import pandas as pd

sys.path.append("../utils/")
from sequence_analysis import count_5mc_sequences

if __name__ == "__main__":
    # set the path for the input file
    input_file_path = pathlib.Path("../data/sequences_to_analyze.txt").resolve(
        strict=True
    )
    # import the data
    data = pd.read_csv(input_file_path, sep="\t", header=None)
    data.rename(columns={0: "sequence"}, inplace=True)

    core_count = multiprocessing.cpu_count() - 2
    print(f"Running on {core_count} cores")
    # Create a pool of worker processes
    pool = multiprocessing.Pool(processes=core_count)
    # start time profiling
    pool_start_time = time.time()
    # Use the pool to map the analyze_sequences function to the sequences in the data
    results = pool.map(count_5mc_sequences, data["sequence"])

    # Close the pool and wait for the work to finish
    pool.close()
    pool.join()
    # end time profiling
    pool_end_time = time.time()

    # Convert the results to a DataFrame for easier analysis
    results_df = pd.DataFrame(
        results, columns=["raw_count", "c_count", "count_5mc", "sequence"]
    )
    # write the results to a file
    pathlib.Path("../results").mkdir(parents=True, exist_ok=True)
    results_df.to_csv("../results/5mc_multiprocessing.csv", sep=",", index=False)
    print(f"{pool_end_time - pool_start_time} seconds to analyze.")
