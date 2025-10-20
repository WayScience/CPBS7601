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

    return c_count, raw_count, count_5mc, sequence
