import argparse
import pathlib

import pandas as pd


def count_5mc_sequences(sequence: str) -> tuple:
    """
    This function analyzes a sequence for 5mc content and returns the results.

    Parameters
    ----------
    sequence : string
        a string of DNA sequence

    Returns
    -------
    c_count : int
        the number of 5mc sites in the sequence
    raw_count : int
        the total number of C sites in the sequence
    """

    # cast the sequence to uppercase
    sequence = sequence.upper()
    raw_count = 0
    c_count = 0
    count_5mc = 0
    for sequence_element in enumerate(sequence):
        if sequence_element[1] == "X":
            c_count += 1
        raw_count += 1

    return c_count, raw_count, count_5mc


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
    c_count, raw_count, count_5mc = count_5mc_sequences(sequence)
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
