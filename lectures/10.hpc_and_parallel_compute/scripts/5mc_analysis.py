import argparse
import pathlib
import sys

import pandas as pd

sys.path.append("../utils/")
from sequence_analysis import count_5mc_sequences


def main():
    # set up parser for command line arguments
    parser = argparse.ArgumentParser(
        description="Analyze DNA sequences for CpG content"
    )
    parser.add_argument("--sequence", help="A DNA sequence to analyze")
    parser.add_argument("--output_file_name", help="The file to write the results to")
    args = parser.parse_args()
    sequence = args.sequence
    output_file_name = args.output_file_name
    c_count, raw_count, count_5mc, sequence = count_5mc_sequences(sequence)
    # write the results to a file
    output_file = pathlib.Path("../results", output_file_name)
    # make the results directory if it doesn't exist
    output_file.parent.mkdir(parents=True, exist_ok=True)
    if not output_file.exists():
        with open(output_file, "w") as f:
            f.write("raw_count,c_count,count_5mc,sequence\n")
            f.write(f"{raw_count},{c_count},{count_5mc},{sequence}\n")
    else:
        with open(output_file, "a") as f:
            f.write(f"{raw_count},{c_count},{count_5mc},{sequence}\n")


if __name__ == "__main__":
    main()
