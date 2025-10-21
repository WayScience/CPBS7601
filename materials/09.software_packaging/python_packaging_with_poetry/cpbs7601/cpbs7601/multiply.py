"""
Demonstrate the usage of poetry.

To run this file, run `poetry run python multiply.py 3 4`
"""

import fire
from math_utils import multiply_integers


def main(a: int, b: int):
    """
    Command-line interface to multiply two integers using Python Fire.

    Parameters
    ----------
    a : int
        The first integer to multiply.
    b : int
        The second integer to multiply.

    Example
    -------
    $ python multiply.py 3 4
    12
    """
    result = multiply_integers(a, b)
    print(result)


if __name__ == "__main__":
    fire.Fire(main)
