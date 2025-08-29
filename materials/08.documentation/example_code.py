"""
This is a docstring. It describes the purpose of the file.
In our case, this file will demonstate how to document code.

Note: Any formatting errors will be fixed by pre-commit.

To test this file, run `pytest .` in terminal :)
"""

import numpy as np
import pandas as pd


def add_integers(a: int, b: int) -> int:
    """Add two integers and return the result.

    Args:
      a (int): The first integer.
      b (int): The second integer.

    Returns: int: The sum of a and b.
    """
    return a + b
