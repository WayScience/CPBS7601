"""
Define a function to multiply two integers.
"""


def multiply_integers(a: int, b: int) -> int:
    """
    Multiply two integers together and return the result.

    This function takes two integer inputs and returns their product.
    It performs basic type checking to ensure both inputs are integers,
    raising a TypeError otherwise.

    Parameters
    ----------
    a : int
        The first integer to multiply.
    b : int
        The second integer to multiply.

    Returns
    -------
    int
        The product of `a` and `b`.

    Raises
    ------
    TypeError
        If either `a` or `b` is not an integer.

    Examples
    --------
    >>> multiply_integers(3, 4)
    12
    >>> multiply_integers(-2, 5)
    -10
    """
    if not isinstance(a, int) or not isinstance(b, int):
        raise TypeError("Both arguments must be integers.")
    return a * b
