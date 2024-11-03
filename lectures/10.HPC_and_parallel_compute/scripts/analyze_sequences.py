import pathlib

import pandas as pd 
import argparse

def analyze_sequences(sequence: str) -> tuple:
    """
    This function analyzes a sequence for CpG content and returns the results.

    Parameters
    ----------
    sequence : string
        a string of DNA sequence

    Returns
    -------
    c_count : int
        the number of CpG sites in the sequence
    raw_count : int
        the total number of C sites in the sequence
    """

    # cast the sequence to uppercase
    sequence = sequence.upper()
    raw_count = 0
    c_count = 0
    cpg_count = 0
    for i in enumerate(sequence):
        if i[1] == "X":
            c_count += 1
        raw_count += 1
    
    return c_count, raw_count

def main():
    # set up parser for command line arguments
    parser = argparse.ArgumentParser(description="Analyze DNA sequences for CpG content")
    parser.add_argument("--sequence", help="A DNA sequence to analyze")
    args = parser.parse_args()
    sequence = args.DNA_sequence
    c_count, raw_count = analyze_sequences(sequence)
    # write the results to a file
    output_file = pathlib.Path("results", "cpg_analysis.csv")
    # make the results directory if it doesn't exist
    output_file.parent.mkdir(parents=True, exist_ok=True)
    with open(output_file, "w") as f:
        f.write(f"raw_count,c_count, sequence\n")
        f.write(f"{raw_count},{c_count},{sequence}\n")

if __name__ == "__main__":
    main()
